//inits console system
prev_cmd = '';

set_application_title(room_caption);
set_automatic_draw(false);
window_set_position(-512, -512);
if quiet = 0 || quiet = 1 {window_set_visible(false);}
if quiet != 0 {exit;}

global.gui[0] = -1;
global.gui[1] = -1;
global.gui[2] = -1;
global.gui[3] = -1;
global.gui[4] = -1;
API_Init();
con_window_init();
