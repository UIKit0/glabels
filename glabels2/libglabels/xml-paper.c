/*
 *  (LIBGLABELS) Template library for GLABELS
 *
 *  xml-paper.c:  paper xml module
 *
 *  Copyright (C) 2003, 2004  Jim Evins <evins@snaught.com>.
 *
 *  This file is part of the LIBGLABELS library.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Library General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Library General Public License for more details.
 *
 *  You should have received a copy of the GNU Library General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
 *  MA 02111-1307, USA
 */
#include <config.h>

#include <glib/gi18n.h>
#include <string.h>
#include <libintl.h>

#include "libglabels-private.h"

#include "xml.h"
#include "xml-paper.h"

/*===========================================*/
/* Private types                             */
/*===========================================*/

/*===========================================*/
/* Private globals                           */
/*===========================================*/

/*===========================================*/
/* Local function prototypes                 */
/*===========================================*/


/*****************************************************************************/
/* Read papers from paper file.                                              */
/*****************************************************************************/
GList *
gl_xml_paper_read_papers_from_file (gchar *utf8_filename)
{
	gchar      *filename;
	GList      *papers;
	xmlDocPtr   papers_doc;

	LIBXML_TEST_VERSION;

	filename = g_filename_from_utf8 (utf8_filename, -1, NULL, NULL, NULL);
	if (!filename) {
		g_warning ("Utf8 filename conversion error");
		return NULL;
	}

	papers_doc = xmlParseFile (filename);
	if (!papers_doc) {
		g_warning ("\"%s\" is not a glabels paper file (not XML)",
			   filename);
		return NULL;
	}

	papers = gl_xml_paper_parse_papers_doc (papers_doc);

	g_free (filename);
	xmlFreeDoc (papers_doc);

	return papers;
}

/*****************************************************************************/
/* Read papers from paper xml doc tree.                                      */
/*****************************************************************************/
GList *
gl_xml_paper_parse_papers_doc (xmlDocPtr  papers_doc)
{
	GList      *papers = NULL;
	xmlNodePtr  root, node;
	glPaper    *paper;

	LIBXML_TEST_VERSION;

	root = xmlDocGetRootElement (papers_doc);
	if (!root || !root->name) {
		g_warning ("\"%s\" is not a glabels paper file (no root node)",
			   papers_doc->name);
		xmlFreeDoc (papers_doc);
		return papers;
	}
	if (!xmlStrEqual (root->name, "Glabels-paper-sizes")) {
		g_warning ("\"%s\" is not a glabels paper file (wrong root node)",
			   papers_doc->name);
		xmlFreeDoc (papers_doc);
		return papers;
	}

	for (node = root->xmlChildrenNode; node != NULL; node = node->next) {

		if (xmlStrEqual (node->name, "Paper-size")) {
			paper = gl_xml_paper_parse_paper_node (node);
			papers = g_list_append (papers, paper);
		} else {
			if ( !xmlNodeIsText(node) ) {
				if (!xmlStrEqual (node->name,"comment")) {
					g_warning ("bad node =  \"%s\"",node->name);
				}
			}
		}
	}

	return papers;
}

/*****************************************************************************/
/* Parse XML paper Node.                                                     */
/*****************************************************************************/
glPaper *
gl_xml_paper_parse_paper_node (xmlNodePtr paper_node)
{
	glPaper               *paper;
	gchar                 *id, *name;
	gdouble                width, height;

	LIBXML_TEST_VERSION;

	id   = xmlGetProp (paper_node, "id");

	name = xmlGetProp (paper_node, "_name");
	if (name != NULL) {

		gchar *tmp = gettext (name);

		if (tmp != name) {
			g_free (name);
			name = g_strdup (tmp);
		}

	} else {
		name = xmlGetProp (paper_node, "name");
	}

	width  = gl_xml_get_prop_length (paper_node, "width", 0);
	height = gl_xml_get_prop_length (paper_node, "height", 0);

	paper = gl_paper_new (id, name, width, height);

	g_free (id);
	g_free (name);

	return paper;
}
