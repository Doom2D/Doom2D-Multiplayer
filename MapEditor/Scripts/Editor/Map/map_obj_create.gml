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
   o = instance_create(xx, yy, o_liquid);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 5:
   o = instance_create(xx, yy, o_liquid);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 6:
   o = instance_create(xx, yy, o_liquid);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = global.tex[tx];
   o.image_single = 0;
  break;
  case 7:
   if place_meeting(xx, yy, o_lift) {exit;}
   o = instance_create(xx, yy, o_lift);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lifts;
   o.image_single = 0;
  break;
  case 8:
   if place_meeting(xx, yy, o_lift) {exit;}
   o = instance_create(xx, yy, o_lift);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lifts;
   o.image_single = 1;
  break;
  case 9:
   if place_meeting(xx, yy, o_lift) {exit;}
   o = instance_create(xx, yy, o_lift);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lifts;
   o.image_single = 2;
  break;
  case 10:
   if place_meeting(xx, yy, o_lift) {exit;}
   o = instance_create(xx, yy, o_lift);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_lifts;
   o.image_single = 3;
  break;
  case 11:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_meds;
   o.image_single = 0;
  break;
  case 12:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_meds;
   o.image_single = 1;
  break;
  case 13:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_armor1;
   o.image_single = 0;
  break;
  case 14:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_armor2;
   o.image_single = 0;
  break;
  case 15:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_bsphr;
   o.image_single = 0;
  break;
  case 16:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_wsphr;
   o.image_single = 0;
  break;
  case 17:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_inv;
   o.image_single = 0;
  break;
  case 18:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_jetpack;
   o.image_single = 0;
  break;
  case 19:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_meds;
   o.image_single = 2;
  break;
  
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
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_ammo;
   o.image_single = sl-20;
  break;
  
  case 31:
  case 32:
  case 33:
  case 34:
  case 35:
  case 36:
  case 37:
  case 38:
   o = instance_create(xx, yy, o_item);
   o.o_id = sl;
   o.t_id = tx;
   o.sprite_index = s_weaps;
   o.image_single = sl-31;
  break;
  case 39:
   if place_meeting(xx, yy, o_spawn) {exit;}
   o = instance_create(xx, yy, o_spawn);
   o.o_id = sl;
   o.t_id = tx;
  break;
}
