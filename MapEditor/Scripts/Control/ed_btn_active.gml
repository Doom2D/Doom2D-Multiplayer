if trg != noone && instance_exists(trg)
{
  if global.ed_mode == MODE_TRIGZONE
  {
    trg.image_xscale = (round_mouse_x() + x_off - trg.x) / 16;
    trg.image_yscale = (round_mouse_y() + y_off - trg.y) / 16;
  }
  if global.ed_mode == MODE_TRIGACT
  {
    trg.xx[2] = round_mouse_x() + x_off;
    trg.yy[2] = round_mouse_y() + y_off;
  }
  exit;
}

x2 = round_mouse_x() + x_off;
y2 = round_mouse_y() + y_off;
