//this script sets editor window
//arg0 - new width
//arg1 - new height
//arg2 - restore coords

var new_w, new_h;
new_w = argument0;
new_h = argument1;

if view_xview + new_w > global.map_w { view_xview = max(0, global.map_w - new_w); }
if view_yview + new_h > global.map_h { view_yview = max(0, global.map_h - new_h); }

view_wview = new_w;
view_hview = new_h;
view_wport = new_w;
view_hport = new_h;

window_set_size(new_w, new_h);
room_restart();

if argument2
{
  win_x = window_get_x();
  win_y = window_get_y();
  room_speed = 9999;
  alarm[0] = 1;
} else {
  window_center();
}

