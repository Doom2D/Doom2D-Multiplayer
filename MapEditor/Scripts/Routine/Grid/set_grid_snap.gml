//set the grid snapping state
//arg0 - state to set
//arg1 - switch radiobuttons in editor settings window

if argument0 {global.ed_g_sz = global.ed_g_szo;} else {global.ed_g_sz = 1;}
global.ed_g_use = argument0;
if argument1 && API_Window_Exists(ui_win2) {API_Button_SetCheck(ui_win2_cb2, argument0);}
