//creates object at map loading
//a0 - object id
//a1 - extended id (texture/trigger number, client uses only textures)
//a2 - x
//a3 - y

var a_obj, a_ext, a_x, a_y, o;
a_obj = argument0;
a_ext = argument1;
a_x = argument2;
a_y = argument3;
o = noone;

switch a_obj
{
  case 0:
   o = instance_create(a_x, a_y, o_solid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   if o.image_number > 1 {o.image_speed = 0.06;} else {o.image_speed = 0;}
  break;
  case 1:
   o = instance_create(a_x, a_y, o_jthr);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   if o.image_number > 1 {o.image_speed = 0.06;} else {o.image_speed = 0;}
  break;
  case 2:
   o = instance_create(a_x, a_y, o_bkg);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   if o.image_number > 1 {o.image_speed = 0.06;} else {o.image_speed = 0;}
  break;
  case 3:
   o = instance_create(a_x, a_y, o_frg);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   if o.image_number > 1 {o.image_speed = 0.06;} else {o.image_speed = 0;}
  break;
  case 4:
   o = instance_create(a_x, a_y, o_liq);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   if o.image_number > 1 {o.image_speed = 0.06;} else {o.image_speed = 0;}
  break;
  case 5:
   o = instance_create(a_x, a_y, o_liq);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   if o.image_number > 1 {o.image_speed = 0.06;} else {o.image_speed = 0;}
  break;
  case 6:
   o = instance_create(a_x, a_y, o_liq);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   if o.image_number > 1 {o.image_speed = 0.06;} else {o.image_speed = 0;}
  break;
  case 7:
   o = instance_create(a_x, a_y, o_lift_up);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lift;
   o.image_single = 0;
  break;
  case 8:
   o = instance_create(a_x, a_y, o_lift_down);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lift;
   o.image_single = 1;
  break;
  case 9:
   o = instance_create(a_x, a_y, o_lift_left);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lift;
   o.image_single = 2;
  break;
  case 10:
   o = instance_create(a_x, a_y, o_lift_right);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lift;
   o.image_single = 3;
  break;
}

if a_obj == 0 && instance_exists(o)
{
    ds_list_add(global.cl_tiles, o.id);
    o.tile_id = ds_list_size(global.cl_tiles) - 1;
}

if a_obj <= 6 && a_ext == 0 {o.visible = false;}
