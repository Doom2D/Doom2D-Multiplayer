//sets the grid size
//arg0 - grid size
//arg1 - switch radiobuttons in editor settings window

switch argument0
{
  case 16:
    if global.ed_g_vis {background_assign(bk_current, bk_grid16);}
    if global.ed_g_sz != 1 {global.ed_g_sz = 16;}
    global.ed_g_szo = 16;
    if argument1 && API_Window_Exists(ui_win2)
    {
      API_Button_SetCheck(ui_win2_rb1, true);
      API_Button_SetCheck(ui_win2_rb2, false);
    }
  break;
  
  case 8:
    if global.ed_g_vis {background_assign(bk_current, bk_grid8);}
    if global.ed_g_sz != 1 {global.ed_g_sz = 8;}
    global.ed_g_szo = 8;
    if argument1 && API_Window_Exists(ui_win2)
    {
      API_Button_SetCheck(ui_win2_rb1, false);
      API_Button_SetCheck(ui_win2_rb2, true);
    }
  break;
}
