//processes editor settings window
if ui_win2 == -1 {exit;}
if !API_Window_GetFocus(ui_win2) {exit;}

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
    set_grid_size(16, false);
  break;
  
  case ui_win2_rb2:
    set_grid_size(8, false);
  break;

  case ui_win2_cb1:
    set_grid_vis(API_Button_GetCheck(ui_win2_cb1), false);
  break;
  
  case ui_win2_cb2:
    set_grid_snap(API_Button_GetCheck(ui_win2_cb2), false);
  break;
  
  case ui_win2_cb3:
    global.ed_outline = API_Button_GetCheck(ui_win2_cb3);
  break;
}
