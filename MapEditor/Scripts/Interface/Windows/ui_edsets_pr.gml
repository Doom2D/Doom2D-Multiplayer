//processes editor settings window
if ui_win2 == -1 {exit;}

var cmd3;
cmd3 = API_Check_Command(3);
if cmd3 == 0 {exit;}

switch cmd3
{
  case ui_win2_b1:
    var color_temp;
    color_temp = get_color(background_color);
    if color_temp != -1 {background_color = color_temp;}
  break;
  
  case ui_win2_b2:
    API_Window_Destroy(ui_win2);
    ui_win2 = -1;
  break;

  case ui_win2_rb1:
    if global.ed_g_vis {background_assign(bk_current, bk_grid16);}
    if global.ed_g_sz != 1 {global.ed_g_sz = 16;}
    global.ed_g_szo = 16;
  break;
  
  case ui_win2_rb2:
    if global.ed_g_vis {background_assign(bk_current, bk_grid8);}
    if global.ed_g_sz != 1 {global.ed_g_sz = 8;}
    global.ed_g_szo = 8;
  break;

  case ui_win2_cb1:
    if !API_Button_GetCheck(ui_win2_cb1)
    {
      background_assign(bk_current, bk_nogrid);
      global.ed_g_vis = false;
    } else {
      if global.ed_g_szo == 16
      {
        background_assign(bk_current, bk_grid16);
      } else {
        background_assign(bk_current, bk_grid8);
      }
      global.ed_g_vis = true;
    }
  break;
  
  case ui_win2_cb2:
    if !API_Button_GetCheck(ui_win2_cb2) 
    {
      global.ed_g_sz = 1;
      global.ed_g_use = false;
    } else {
      global.ed_g_sz = global.ed_g_szo;
      global.ed_g_use = true;
    }
  break;
  
  case ui_win2_cb3:
    global.ed_outline = API_Button_GetCheck(ui_win2_cb3);
  break;
}
