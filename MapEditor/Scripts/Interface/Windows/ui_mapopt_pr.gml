//processes map optimization window
if ui_win7 == -1 {exit;}

var cmd8;
cmd8 = API_Check_Command(8);
if cmd8 == 0 {exit;}

switch cmd8
{
  case ui_win7_b1:
    if !mb_chkobj(ui_win7) {exit;}
    
    var op_tl, op_it, op_ar, op_tg;
    op_tl = API_Button_GetCheck(ui_win7_cb1);
    op_it = API_Button_GetCheck(ui_win7_cb2);
    op_ar = API_Button_GetCheck(ui_win7_cb3);
    op_tg = API_Button_GetCheck(ui_win7_cb4);
    if !(op_tl || op_it || op_ar || op_tg)
    {
      API_Dialog_MessageBox(argument0,
          'Вы должны выбрать тайлы для оптимизации.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    
    var o_dup, o_out;
    o_dup = API_Button_GetCheck(ui_win7_cb5);
    o_out = API_Button_GetCheck(ui_win7_cb6);
    if !(o_dup || o_out)
    {
      API_Dialog_MessageBox(argument0,
          'Вы должны указать способ оптимизации.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    
    if !mb_confirm(ui_win7) {exit;}
    API_Window_SetText(ui_win7, 'Обработка...');
    
    var dup_r, out_r;
    dup_r = 0; out_r = 0;
    with par_obj
    {
      if o_id >= 0 && o_id <= 10 && !op_tl {continue;}
      if (o_id >= 11 && o_id <= 38) || o_id == 49 && !op_it {continue;}
      if o_id >= 39 && o_id <= 43 && !op_ar {continue;}
      if o_id >= 44 && o_id <= 48 && !op_tg {continue;}
      
      if o_dup
      {
        with par_obj
        {
          if id == other.id {continue;}
          if o_id >= 0 && o_id <= 10 && !op_tl {continue;}
          if (o_id >= 11 && o_id <= 38) || o_id == 49 && !op_it {continue;}
          if o_id >= 39 && o_id <= 43 && !op_ar {continue;}
          if o_id >= 44 && o_id <= 48 && !op_tg {continue;}
          
          if o_id != other.o_id || t_id != other.t_id || x != other.x || y != other.y {continue;}
          if o_id > 43 && o_id < 49
          {
            if image_xscale != other.image_xscale || image_yscale != other.image_yscale {continue;}
            if t_id != 8 { if xx[1] != other.xx[1] || yy[1] != other.yy[1] {continue;} }
            if t_id < 7 { if xx[2] != other.xx[2] || yy[2] != other.yy[2] {continue;} }
          }
          instance_destroy();
          dup_r += 1;
        }
      }
      
      if o_out
      {
        var sp_yoff;
        if o_id >= 39 && o_id <= 41 {sp_yoff = 12;} else {sp_yoff = 0;}
        if (x + o_w > 0 && x < global.map_w) &&
           (y + o_h > 0 && y + sp_yoff < global.map_h) {continue;}
        instance_destroy();
        out_r += 1;
      }
    }
    
    API_Window_SetText(ui_win7, ui_win7_title);
    var obj_num, obj_done;
    obj_num = instance_number(par_obj);
    obj_done = dup_r + out_r;
    API_Dialog_MessageBox(window_handle(),
        'Тайлов до оптимизации: '            + string(obj_num + obj_done) + chr(10) + chr(13) +
        'Тайлов после оптимизации: '         + string(obj_num)            + chr(10) + chr(13) +
        'Удалено тайлов-дубликатов: '        + string(dup_r)              + chr(10) + chr(13) +
        'Удалено тайлов за пределами карты: ' + string(out_r)              + chr(10) + chr(13) +
        'Удалено всего: '                    + string(obj_done),
        'Оптимизация тайлов', MB_OK|MB_ICONINFORMATION);
  break;
  
  case ui_win7_b2:
    API_Window_Destroy(ui_win7);
    ui_win7 = -1;
  break;
}
