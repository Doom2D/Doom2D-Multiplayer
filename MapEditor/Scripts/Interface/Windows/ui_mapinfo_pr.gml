//processes map information window
if ui_win4 == -1 {exit;}

var cmd5;
cmd5 = API_Check_Command(5);
if cmd5 == 0 {exit;}

switch cmd5
{
  case ui_win4_bt:
    API_Control_SetText(ui_win4_t1, 
                        'Текстур: ' + string(global.tex_n - 1) + chr(13) + chr(10) +
                        'Тайлов окружения: ' + string(instance_number(o_solid) +
                                                      instance_number(o_jthr) +
                                                      instance_number(o_bkg) +
                                                      instance_number(o_frg) +
                                                      instance_number(o_liquid) +
                                                      instance_number(o_lift)) + chr(13) + chr(10) +
                        'Предметов: ' + string(instance_number(o_item)) + chr(13) + chr(10) +
                        'Областей: ' + string(instance_number(o_spawn)) + chr(13) + chr(10) +
                        'Триггеров: ' + string(instance_number(o_trigger)));
    API_Control_SetText(ui_win4_bt, 'Обновить статистику');
  break;

  case WM_DESTROY:
    ui_win4 = -1;
  break;
}
