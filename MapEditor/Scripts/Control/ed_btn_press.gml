if trg != noone && instance_exists(trg)
{
  if global.ed_mode == 2
  {
    trg.xx[1] = round_mouse_x() + x_off;
    trg.yy[1] = round_mouse_y() + y_off;
    if trg.t_id == 7
    {
      trg = noone;
      global.ed_mode = 0;
    }
  }
  exit;
}

var sl;
sl = API_Combobox_GetSel(ui_tl_cb);
x1 = round_mouse_x();
y1 = round_mouse_y();
if !keyboard_check(vk_shift) 
{
  x1 += x_off - ix_off;
  y1 += y_off - iy_off;
  map_obj_create(sl, tx, x1, y1, 0, 0, x1, y1, x1, y1);
}
