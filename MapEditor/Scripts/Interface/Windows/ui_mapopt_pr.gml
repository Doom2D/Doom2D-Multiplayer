//processes map optimization window
if ui_win7 == noval {exit;}

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
      API_Dialog_MessageBox(ui_win7,
          'Вы должны выбрать тайлы для оптимизации.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    
    var o_dup, o_out;
    o_dup = API_Button_GetCheck(ui_win7_cb5);
    o_out = API_Button_GetCheck(ui_win7_cb6);
    if !(o_dup || o_out)
    {
      API_Dialog_MessageBox(ui_win7,
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
      if obj_block(o_id) && !op_tl {continue;}
      if obj_item(o_id) || obj_flag(o_id) && !op_it {continue;}
      if obj_area(o_id) && !op_ar {continue;}
      if obj_trig(o_id) && !op_tg {continue;}
      
      if o_dup
      {
        with par_obj
        {
          if id == other.id {continue;}
          if obj_block(o_id) && !op_tl {continue;}
          if obj_item(o_id) || obj_flag(o_id) && !op_it {continue;}
          if obj_area(o_id) && !op_ar {continue;}
          if obj_trig(o_id) && !op_tg {continue;}
          
          if o_id != other.o_id || t_id != other.t_id || x != other.x || y != other.y {continue;}
          if obj_trig(o_id)
          {
            if image_xscale != other.image_xscale || image_yscale != other.image_yscale {continue;}
            if t_id != TRAC_ENDROUND
            {
              if xx[1] != other.xx[1] || yy[1] != other.yy[1] {continue;}
              if t_id != TRAC_TELEPORT { if xx[2] != other.xx[2] || yy[2] != other.yy[2] {continue;} }
            }
          }
          instance_destroy();
          dup_r += 1;
        }
      }
      
      if o_out
      {
        var sp_yoff;
        if obj_area(o_id) {sp_yoff = 12;} else {sp_yoff = 0;}
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
        'Тайлов до оптимизации: '             + string(obj_num + obj_done) + EOL +
        'Тайлов после оптимизации: '          + string(obj_num)            + EOL +
        'Удалено тайлов-дубликатов: '         + string(dup_r)              + EOL +
        'Удалено тайлов за пределами карты: ' + string(out_r)              + EOL +
        'Удалено всего: '                     + string(obj_done),
        'Оптимизация тайлов', MB_OK|MB_ICONINFORMATION);
  break;
  
  case ui_win7_b2:
    API_Window_Destroy(ui_win7);
    ui_win7 = noval;
  break;
}
