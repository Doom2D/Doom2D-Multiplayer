if trg != noone && instance_exists(trg)
{
  if global.ed_mode == MODE_TRIGACT
  {
    trg.xx[1] = round_mouse_x() + x_off;
    trg.yy[1] = round_mouse_y() + y_off;
    if trg.t_id == TRAC_TELEPORT
    {
      trg = noone;
      global.ed_mode = MODE_NORMAL;
    }
  }
  exit;
}

x1 = round_mouse_x();
y1 = round_mouse_y();
if !keyboard_check(vk_shift) 
{
  x1 += x_off - ix_off;
  y1 += y_off - iy_off;
  map_obj_create(obj_sel, tex_sel, x1, y1, 0, 0, x1, y1, x1, y1);
}
