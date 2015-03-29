[winrules]
s0_above_match = (class=Ccsm) | (class=Toggl-desktop)  | (class=Zenity)  | class=Procexp.py  | class=Gnome-screenshot  | (class=Wallch) | class=xpad | class=Gnome-control-center | class=Sesame_x64 | class=TogglDesktop | class=Autokey-qt
s0_sticky_match = (class=Ccsm) | class=Toggl-desktop | (class=Zenity & title=Pick a screensaver)  | (class=Wallch) | (class=xpad) | class=TogglDesktop
s0_no_move_match = (class=Pidgin & role=buddy_list) | (class=Pidgin & role=conversation) | ((class=Skype) & !(role=ConversationsWindow)  & title=lucy.davies.openbet - Skype™) | ((class=Skype) & (role=ConversationsWindow))
s0_no_resize_match = (class=Pidgin & role=buddy_list) | (class=Pidgin & role=conversation) | ((class=Skype) & !(role=ConversationsWindow)  & title=lucy.davies.openbet - Skype™) | ((class=Skype) & (role=ConversationsWindow))
s0_size_matches = (class=Pidgin) & role=buddy_list;(class=Pidgin) & role=conversation;(class=Skype) & !(role=ConversationsWindow)  & title=lucy.davies.openbet - Skype™;(class=Skype) & role=ConversationsWindow;
s0_size_width_values = 280;1310;280;1310;
s0_size_height_values = 1030;515;1030;515;

[decor]
s0_decoration_match = (any) & !(class=Pidgin)  & !(class=Toggl-desktop)  & !(class=Firefox)  & !(class=Skype) & !(class=xpad)   & ! (name=crx_hmjkmjkepdijhoojdojkdfohbdgmmhki) | !(class=Gnome-terminal) | !(class=TogglDesktop)(class=Toggl-desktop | (name=crx_hmjkmjkepdijhoojdojkdfohbdgmmhki) | class=TogglDesktop) | (title=Work | Trello & class=Google-chrome-stable)

[place]
s0_position_matches = (class=Pidgin) & role=buddy_list;(class=Pidgin) & role=conversation;(class=Skype) & !(role=ConversationsWindow)  & title=lucy.davies.openbet - Skype™;(class=Skype) & role=ConversationsWindow;
s0_position_x_values = 15;310;1635;310;
s0_position_y_values = 30;30;30;545;
s0_position_constrain_workarea = false;false;false;false;

[wall]
s0_preview_timeout = 0.000000
s0_preview_scale = 400
s0_slide_duration = 0.500000
s0_no_slide_match = type=Dock | type=Desktop | name=glmatrix | state=Sticky

[snap]
s0_edges_categories = 0;1;
s0_attraction_distance = 60

[grid]
s0_put_left_key = <Control><Primary><Alt>KP_4
s0_put_right_key = <Control><Primary><Alt>KP_6
s0_put_restore_key = <Control><Primary><Alt>KP_0
s0_top_left_corner_action = 7
s0_top_edge_action = 8
s0_top_right_corner_action = 9
s0_bottom_left_corner_action = 1
s0_bottom_edge_action = 2
s0_bottom_right_corner_action = 3

[gnomecompat]
s0_main_menu_key = Disabled
s0_run_key = Disabled
s0_command_screenshot = gnome-screenshot -i

[core]
s0_active_plugins = core;composite;opengl;compiztoolbox;decor;place;mousepoll;regex;wall;resize;move;grid;session;gnomecompat;vpswitch;commands;obs;widget;imgpng;winrules;unitymtgrabhandles;animation;workarounds;expo;fade;ezoom;scale;unityshell;
s0_toggle_window_shaded_key = Disabled

[commands]
s0_command0 = google-chrome
s0_command1 = google-chrome https://wiki.openbet/pages/editpage.action?pageId=22559837
s0_command2 = /home/ldavies/bin/wspaces
s0_command3 = /home/ldavies/bin/matrixme
s0_command4 = /home/ldavies/bin/pstatus
s0_command5 = /home/ldavies/bin/jira_tickets
s0_command6 = xpad -t
s0_command7 = /home/ldavies/bin/kanban
s0_command8 = gnome-terminal -e "ssh -X dev03"
s0_command9 = /home/ldavies/bin/jenkins_smoke_test
s0_command10 = /home/ldavies/bin/backup_xpad
s0_run_command0_key = <Control><Primary><Alt>f
s0_run_command1_key = <Control><Primary><Alt>q
s0_run_command2_key = <Control><Primary><Alt>w
s0_run_command3_key = <Control><Primary><Alt>m
s0_run_command4_key = <Shift><Control><Primary><Alt>p
s0_run_command5_key = <Control><Primary><Alt>j
s0_run_command6_key = <Alt><Super>n
s0_run_command7_key = <Control><Primary><Alt>k
s0_run_command8_key = <Control><Primary><Alt>d
s0_run_command9_key = <Control><Primary><Alt>s
s0_run_command10_key = <Control><Primary><Alt>x

[obs]
s0_opacity_matches = class=Pidgin;class=Skype;class=Wallch;
s0_opacity_values = 90;90;50;0;

[unityshell]
s0_launcher_hide_mode = 1
s0_panel_first_menu = Disabled
s0_backlight_mode = 1
s0_panel_opacity = 0.000000
s0_panel_opacity_maximized_toggle = true
s0_launcher_opacity = 0.000000
s0_icon_size = 42
s0_shortcut_overlay = false
s0_launcher_capture_mouse = false

[widget]
s0_toggle_key = <Control><Primary><Alt>p
s0_match = (class=Toggl-desktop | (name=crx_hmjkmjkepdijhoojdojkdfohbdgmmhki) | class=TogglDesktop) | (title=Work | Trello & class=Google-chrome-stable)
s0_fade_time = 1.000000
s0_bg_saturation = 0

