<?xml version="1.0"?>
<interface>
  <requires lib="gtk+" version="2.16"/>
  <!-- interface-naming-policy toplevel-contextual -->
  <object class="GtkWindow" id="window1">
    <child>
      <object class="GtkVBox" id="merge_properties_vbox">
        <property name="visible">True</property>
        <property name="orientation">vertical</property>
        <property name="spacing">6</property>
        <child>
          <object class="GtkFrame" id="frame1">
            <property name="visible">True</property>
            <property name="label_xalign">0</property>
            <property name="shadow_type">none</property>
            <child>
              <object class="GtkAlignment" id="alignment1">
                <property name="visible">True</property>
                <property name="left_padding">12</property>
                <child>
                  <object class="GtkTable" id="table1">
                    <property name="visible">True</property>
                    <property name="border_width">12</property>
                    <property name="n_rows">2</property>
                    <property name="n_columns">2</property>
                    <property name="column_spacing">6</property>
                    <property name="row_spacing">6</property>
                    <child>
                      <object class="GtkLabel" id="label3">
                        <property name="visible">True</property>
                        <property name="xalign">0</property>
                        <property name="label" translatable="yes">Format:</property>
                      </object>
                      <packing>
                        <property name="x_options">GTK_FILL</property>
                        <property name="y_options"></property>
                      </packing>
                    </child>
                    <child>
                      <object class="GtkComboBox" id="type_combo">
                        <property name="visible">True</property>
                        <property name="focus_on_click">False</property>
                      </object>
                      <packing>
                        <property name="left_attach">1</property>
                        <property name="right_attach">2</property>
                        <property name="y_options">GTK_FILL</property>
                      </packing>
                    </child>
                    <child>
                      <object class="GtkVBox" id="location_vbox">
                        <property name="visible">True</property>
                        <property name="orientation">vertical</property>
                        <child>
                          <placeholder/>
                        </child>
                      </object>
                      <packing>
                        <property name="left_attach">1</property>
                        <property name="right_attach">2</property>
                        <property name="top_attach">1</property>
                        <property name="bottom_attach">2</property>
                        <property name="x_options">GTK_FILL</property>
                        <property name="y_options">GTK_FILL</property>
                      </packing>
                    </child>
                    <child>
                      <object class="GtkLabel" id="label4">
                        <property name="visible">True</property>
                        <property name="xalign">0</property>
                        <property name="label" translatable="yes">Location:</property>
                      </object>
                      <packing>
                        <property name="top_attach">1</property>
                        <property name="bottom_attach">2</property>
                        <property name="x_options">GTK_FILL</property>
                        <property name="y_options"></property>
                      </packing>
                    </child>
                  </object>
                </child>
              </object>
            </child>
            <child type="label">
              <object class="GtkLabel" id="label1">
                <property name="visible">True</property>
                <property name="label" translatable="yes">&lt;b&gt;Source&lt;/b&gt;</property>
                <property name="use_markup">True</property>
              </object>
            </child>
          </object>
          <packing>
            <property name="expand">False</property>
            <property name="position">0</property>
          </packing>
        </child>
        <child>
          <object class="GtkFrame" id="frame2">
            <property name="visible">True</property>
            <property name="label_xalign">0</property>
            <property name="shadow_type">none</property>
            <child>
              <object class="GtkAlignment" id="alignment2">
                <property name="visible">True</property>
                <property name="left_padding">12</property>
                <child>
                  <object class="GtkVBox" id="vbox3">
                    <property name="visible">True</property>
                    <property name="orientation">vertical</property>
                    <property name="spacing">6</property>
                    <child>
                      <object class="GtkScrolledWindow" id="scrolledwindow1">
                        <property name="width_request">500</property>
                        <property name="height_request">350</property>
                        <property name="visible">True</property>
                        <property name="can_focus">False</property>
                        <property name="border_width">6</property>
                        <property name="hscrollbar_policy">automatic</property>
                        <property name="vscrollbar_policy">automatic</property>
                        <property name="shadow_type">in</property>
                        <child>
                          <object class="GtkTreeView" id="treeview">
                            <property name="visible">True</property>
                          </object>
                        </child>
                      </object>
                      <packing>
                        <property name="position">0</property>
                      </packing>
                    </child>
                    <child>
                      <object class="GtkHBox" id="hbox1">
                        <property name="visible">True</property>
                        <property name="border_width">6</property>
                        <property name="spacing">12</property>
                        <child>
                          <object class="GtkButton" id="select_all_button">
                            <property name="label" translatable="yes">Select all</property>
                            <property name="visible">True</property>
                            <property name="can_focus">False</property>
                            <property name="receives_default">False</property>
                            <property name="use_underline">True</property>
                            <property name="focus_on_click">False</property>
                          </object>
                          <packing>
                            <property name="expand">False</property>
                            <property name="fill">False</property>
                            <property name="position">0</property>
                          </packing>
                        </child>
                        <child>
                          <object class="GtkButton" id="unselect_all_button">
                            <property name="label" translatable="yes">Unselect all</property>
                            <property name="visible">True</property>
                            <property name="can_focus">False</property>
                            <property name="receives_default">False</property>
                            <property name="use_underline">True</property>
                            <property name="focus_on_click">False</property>
                          </object>
                          <packing>
                            <property name="expand">False</property>
                            <property name="fill">False</property>
                            <property name="position">1</property>
                          </packing>
                        </child>
                      </object>
                      <packing>
                        <property name="expand">False</property>
                        <property name="position">1</property>
                      </packing>
                    </child>
                  </object>
                </child>
              </object>
            </child>
            <child type="label">
              <object class="GtkLabel" id="label2">
                <property name="visible">True</property>
                <property name="label" translatable="yes">&lt;b&gt;Record selection/preview&lt;/b&gt;</property>
                <property name="use_markup">True</property>
              </object>
            </child>
          </object>
          <packing>
            <property name="position">1</property>
          </packing>
        </child>
      </object>
    </child>
  </object>
</interface>
