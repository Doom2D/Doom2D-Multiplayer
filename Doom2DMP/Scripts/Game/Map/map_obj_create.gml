//creates object at map loading
//arg0 = obj id
//arg1 = tex id
//arg2 = x
//arg3 = y
var sl;
sl = argument0;
tx = argument1;
xx = argument2;
yy = argument3;
switch sl
{
  case 0:
   if place_meeting(xx, yy, o_solid) {exit;}
   o = instance_create(xx, yy, o_solid);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 1:
   if place_meeting(xx, yy, o_jthr) {exit;}
   o = instance_create(xx, yy, o_jthr);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 2:
   o = instance_create(xx, yy, o_bkg);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 3:
   o = instance_create(xx, yy, o_frg);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 4:
   if place_meeting(xx, yy, o_liq) {exit;}
   o = instance_create(xx, yy, o_liq);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 5:
   if place_meeting(xx, yy, o_liq) {exit;}
   o = instance_create(xx, yy, o_liq);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 6:
   if place_meeting(xx, yy, o_liq) {exit;}
   o = instance_create(xx, yy, o_liq);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 7:
  if place_meeting(xx, yy, o_lift_up) {exit;}
   o = instance_create(xx, yy, o_lift_up);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lift;
   o.image_single = 0;
  break;
  case 8:
  if place_meeting(xx, yy, o_lift_down) {exit;}
   o = instance_create(xx, yy, o_lift_down);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lift;
   o.image_single = 1;
  break;
  case 9:
  if place_meeting(xx, yy, o_lift_left) {exit;}
   o = instance_create(xx, yy, o_lift_left);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lift;
   o.image_single = 2;
  break;
  case 10:
  if place_meeting(xx, yy, o_lift_right) {exit;}
   o = instance_create(xx, yy, o_lift_right);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lift;
   o.image_single = 3;
  break;
}
