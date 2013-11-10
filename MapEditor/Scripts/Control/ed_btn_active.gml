if trg != noone && instance_exists(trg)
{
  if global.ed_mode == 1
  {
    trg.image_xscale = (round_mouse_x() + x_off - trg.x) / 16;
    trg.image_yscale = (round_mouse_y() + y_off - trg.y) / 16;
  }
  if global.ed_mode == 2
  {
    trg.xx[2] = round_mouse_x() + x_off;
    trg.yy[2] = round_mouse_y() + y_off;
  }
  exit;
}

x2 = round_mouse_x();
y2 = round_mouse_y();
