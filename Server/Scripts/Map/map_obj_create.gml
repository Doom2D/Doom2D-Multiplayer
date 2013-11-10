//creates object at map loading
//a0 - object id
//a1 - extended id (texture/trigger number)
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
   o.image_single = 0;
  break;
  case 1:
   o = instance_create(a_x, a_y, o_jthr);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
  break;
  case 2:
   //we need no backgrounds
  break;
  case 3:
   //or foregrounds
  break;
  case 4:
   o = instance_create(a_x, a_y, o_water);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
  break;
  case 5:
   o = instance_create(a_x, a_y, o_acid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   o.dmg = 5;
  break;
  case 6:
   o = instance_create(a_x, a_y, o_acid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   o.dmg = 10;
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
  case 49:
  case 50:
    i = item_find_slot();
    o = instance_create(a_x, a_y, o_item);
    o.item_id = i;
    o.item = a_obj - 10;
    if a_obj == 49 {o.item = 31;}
    if a_obj == 50 {o.item = 32;}
    global.sv_itm[i] = o;
  break;
  case 39:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.team = 0;
  break;
  case 40:
   o = instance_create(a_x, a_y, o_spawn_r);
   o.o_id = a_obj;
   o.t_id = a_ext;
  break;
  case 41:
   o = instance_create(a_x, a_y, o_spawn_b);
   o.o_id = a_obj;
   o.t_id = a_ext;
  break;
  case 42:
    i = item_find_slot();
    o = instance_create(a_x, a_y, o_item);
    o.item_id = i;
    o.item = 29;
    global.sv_itm[i] = o;
    global.red_crd[0] = a_x;
    global.red_crd[1] = a_y;
  break;
  case 43:
    i = item_find_slot();
    o = instance_create(a_x, a_y, o_item);
    o.item_id = i;
    o.item = 30;
    global.sv_itm[i] = o;
    global.blu_crd[0] = a_x;
    global.blu_crd[1] = a_y;
  break;
  case 44:
    o = instance_create(a_x, a_y, trg_atcollide);
    o.t = a_ext;
    o.image_xscale = argument4;
    o.image_yscale = argument5;
    o.xx[1] = argument6;
    o.yy[1] = argument7;
    o.xx[2] = argument8;
    o.yy[2] = argument9;
  break;
  case 45:
    o = instance_create(a_x, a_y, trg_atuse);
    o.t = a_ext;
    o.image_xscale = argument4;
    o.image_yscale = argument5;
    o.xx[1] = argument6;
    o.yy[1] = argument7;
    o.xx[2] = argument8;
    o.yy[2] = argument9;
  break;
  case 46:
    o = instance_create(a_x, a_y, trg_atshot);
    o.t = a_ext;
    o.image_xscale = argument4;
    o.image_yscale = argument5;
    o.xx[1] = argument6;
    o.yy[1] = argument7;
    o.xx[2] = argument8;
    o.yy[2] = argument9;
  break;
  case 47:
    o = instance_create(a_x, a_y, trg_atstart);
    o.t = a_ext;
    o.image_xscale = argument4;
    o.image_yscale = argument5;
    o.xx[1] = argument6;
    o.yy[1] = argument7;
    o.xx[2] = argument8;
    o.yy[2] = argument9;
  break;
  case 48:
    o = instance_create(a_x, a_y, trg_attrg);
    o.t = a_ext;
    o.image_xscale = argument4;
    o.image_yscale = argument5;
    o.xx[1] = argument6;
    o.yy[1] = argument7;
    o.xx[2] = argument8;
    o.yy[2] = argument9;
  break;
}

if a_obj == 0 && instance_exists(o)
{
    ds_list_add(global.sv_tiles, o.id);
    o.tile_id = ds_list_size(global.sv_tiles) - 1;
}
