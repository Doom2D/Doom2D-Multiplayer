//processes objects moving window
if ui_win6 == -1 {exit;}

var cmd7;
cmd7 = API_Check_Command(7);
if cmd7 == 0 {exit;}

switch cmd7
{
  case ui_win6_b1:
    if !mb_chkobj(ui_win6) {exit;}
  
    var move_x, move_y;
    move_x = real(API_Control_GetText(ui_win6_e1));
    move_y = real(API_Control_GetText(ui_win6_e2));

    if move_x == 0 && move_y == 0
    {
      API_Dialog_MessageBox(ui_win6,
          'Вы должны указать хотя бы одно значение.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    
    if !mb_confirm(ui_win6) {exit;}
    API_Window_SetText(ui_win6, 'Обработка...');
    
    var x_type, y_type;
    x_type = API_Button_GetCheck(ui_win6_rb1);
    y_type = API_Button_GetCheck(ui_win6_rb3);
    with par_obj
    {
      if x_type {x += move_x;} else {x -= move_x;}
      if y_type {y += move_y;} else {y -= move_y;}
      if o_id > 43 && o_id < 49 && t_id != 8
      {
        if x_type {xx[1] += move_x;} else {xx[1] -= move_x;}
        if y_type {yy[1] += move_y;} else {yy[1] -= move_y;}
        if t_id != 7
        {
          if x_type {xx[2] += move_x;} else {xx[2] -= move_x;}
          if y_type {yy[2] += move_y;} else {yy[2] -= move_y;}
        }
      }
    }
    
    API_Window_SetText(ui_win6, ui_win6_title);
  break;
  
  case ui_win6_b2:
    API_Window_Destroy(ui_win6);
    ui_win6 = -1;
  break;
}
