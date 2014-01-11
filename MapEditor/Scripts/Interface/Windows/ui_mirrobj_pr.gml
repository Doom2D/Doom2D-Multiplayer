//processes objects mirroring window
if ui_win8 == noval {exit;}

var cmd9;
cmd9 = API_Check_Command(9);
if cmd9 == 0 {exit;}

switch cmd9
{
  case ui_win8_b1:
    if !mb_chkobj(ui_win8) {exit;}
    
    var mr_h, mr_v;
    mr_h = API_Button_GetCheck(ui_win8_cb1);
    mr_v = API_Button_GetCheck(ui_win8_cb2);
    if !(mr_h || mr_v)
    {
      API_Dialog_MessageBox(ui_win8,
          'Вы должны указать направление отражения.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    
    if !mb_confirm(ui_win8) {exit;}
    API_Window_SetText(ui_win8, 'Обработка...');
    
    var tp_mr, o_pr;
    tp_mr = API_Button_GetCheck(ui_win8_rb1);
    
    with par_obj
    {
      if tp_mr {o_pr = id;} else {o_pr = instance_copy(false);}
      with o_pr
      {
        if mr_h
        {
          x = global.map_w - x - o_w;
          if obj_trig(o_id)
          {
            if t_id != TRAC_ENDROUND
            {
              xx[1] = global.map_w - xx[1];
              if t_id != TRAC_TELEPORT {xx[2] = global.map_w - xx[2];}
            }
          }
        }
        if mr_v
        {
          y = global.map_h - y - o_h;
          if obj_trig(o_id)
          {
            if t_id != TRAC_ENDROUND
            {
              yy[1] = global.map_h - yy[1];
              if t_id != TRAC_TELEPORT {yy[2] = global.map_h - yy[2];}
            }
          }
        }
      }
    }
    
    API_Window_SetText(ui_win8, ui_win8_title);
  break;
  
  case ui_win8_b2:
    API_Window_Destroy(ui_win8);
    ui_win8 = noval;
  break;
}
