//sets the grid visibility
//arg0 - state to set
//arg1 - switch radiobuttons in editor settings window

if o_cam.visible {exit;}

if argument0
{
  if global.ed_g_szo == 16
  {
    background_assign(bk_current, bk_grid16);
  } else {
    background_assign(bk_current, bk_grid8);
  }
} else {
  background_assign(bk_current, bk_nogrid);
}

global.ed_g_vis = argument0;
if argument1 && API_Window_Exists(ui_win2) {API_Button_SetCheck(ui_win2_cb1, argument0);}
