//inits console system
prev_cmd = '';

if quiet <= 1 {window_set_visible(false);}
set_automatic_draw(false);

global.gui[0] = -1;
global.gui[1] = -1;
global.gui[2] = -1;
global.gui[3] = -1;
global.gui[4] = -1;

if quiet {exit;}
API_Init();
con_window_init();
