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
   //we need no backgrounds
  break;
  case 3:
   //or foregrounds
  break;
  case 4:
   if place_meeting(xx, yy, o_water) {exit;}
   o = instance_create(xx, yy, o_water);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 5:
   if place_meeting(xx, yy, o_acid) {exit;}
   o = instance_create(xx, yy, o_acid);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
   o.dmg = 5;
  break;
  case 6:
   if place_meeting(xx, yy, o_acid) {exit;}
   o = instance_create(xx, yy, o_acid);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
   o.dmg = 10;
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
  case 11:
  case 12:
  case 13:
  case 14:
  case 15:
  case 16:
  case 17:
  case 18:
  case 19:
  case 20:
  case 21:
  case 22:
  case 23:
  case 24:
  case 25:
  case 26:
  case 27:
  case 28:
  case 29:
  case 30:
  case 31:
  case 32:
  case 33:
  case 34:
  case 35:
  case 36:
  case 37:
  case 38:
    i = item_find_slot();
    o = instance_create(xx, yy, o_item);
    o.item_id = i;
    o.item = sl - 10;
    global.sv_itm[i] = o;
  break;
  case 39:
   o = instance_create(xx, yy, o_spawn);
   o.o_id = sl;
   o.t_id = tx;
  break;
}
