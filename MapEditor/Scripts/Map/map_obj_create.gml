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

if !global.map_proc && a_obj > 43 && a_obj < 49 {a_ext = API_Combobox_GetSel(ui_tg_cb);}

switch a_obj
{
  case 0:
   o = instance_create(a_x, a_y, o_solid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 1:
   o = instance_create(a_x, a_y, o_jthr);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 2:
   o = instance_create(a_x, a_y, o_bkg);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 3:
   o = instance_create(a_x, a_y, o_frg);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 4:
   o = instance_create(a_x, a_y, o_liquid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 5:
   o = instance_create(a_x, a_y, o_liquid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 6:
   o = instance_create(a_x, a_y, o_liquid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 7:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 8:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 1;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 9:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 2;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 10:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 3;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 11:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_meds;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 12:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_meds;
   o.image_single = 1;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 13:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_armor1;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 14:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_armor2;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 15:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_bsphr;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 16:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_wsphr;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 17:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_inv;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 18:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_jetpack;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 19:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_meds;
   o.image_single = 2;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  
  case 25:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_bon1;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 26:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_bon2;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  
  case 20:
  case 21:
  case 22:
  case 23:
  case 24:
  case 27:
  case 28:
  case 29:
  case 30:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_ammo;
   o.image_single = a_obj-20;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  
  case 31:
  case 32:
  case 33:
  case 34:
  case 35:
  case 36:
  case 37:
  case 38:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_weaps;
   o.image_single = a_obj-31;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 49:
    o = instance_create(a_x, a_y, o_item);
    o.o_id = a_obj;
    o.t_id = a_ext;
    o.image_single = 0;
    o.sprite_index = s_vis;
    with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 39:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 40:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.image_single = 1;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 41:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.image_single = 2;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 42:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_flag_r;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 43:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_flag_b;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case 44: case 45: case 46: case 47: case 48:
   o = instance_create(a_x, a_y, o_trigger);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.timer = 0;
   if o.t_id > 500 {o.timer = o.t_id - 500; o.t_id = 4;}
   if o.t_id > 100 {o.timer = o.t_id - 100; o.t_id = 2;}
   o.image_single = a_obj - 44;
   o.image_xscale = argument4;
   o.image_yscale = argument5;
   o.xx[1] = argument6;
   o.yy[1] = argument7;
   o.xx[2] = argument8;
   o.yy[2] = argument9;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
   if !global.map_proc
   {
     trg = o;
     global.ed_mode = 1;
   }
  break;
}

with (o.object_index) { if id != o.id {o.visible = visible; break;} }
