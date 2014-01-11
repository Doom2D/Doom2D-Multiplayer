//creates object at map loading
//a0 - object id
//a1 - extended id (texture/trigger number)
//a2 - x
//a3 - y

var a_obj, a_ext, a_x, a_y, o;
a_obj = argument0;
a_x = argument2;
a_y = argument3;
o = noone;

if !global.map_proc && obj_trig(a_obj) {a_ext = trg_sel;} else {a_ext = argument1;}

switch a_obj
{
  case BLOCK_SOLID:
   o = instance_create(a_x, a_y, o_solid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_JTHR:
   o = instance_create(a_x, a_y, o_jthr);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_BKG:
   o = instance_create(a_x, a_y, o_bkg);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_FRG:
   o = instance_create(a_x, a_y, o_frg);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_WATER:
   o = instance_create(a_x, a_y, o_liquid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_ACID1:
   o = instance_create(a_x, a_y, o_liquid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_ACID2:
   o = instance_create(a_x, a_y, o_liquid);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = global.tex[a_ext];
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_LIFTU:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_LIFTD:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 1;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_LIFTL:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 2;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case BLOCK_LIFTR:
   o = instance_create(a_x, a_y, o_lift);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_lifts;
   o.image_single = 3;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_STIMPACK:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_meds;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_MEDKIT:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_meds;
   o.image_single = 1;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_ARMOR1:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_armor1;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_ARMOR2:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_armor2;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_SOULSPHR:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_bsphr;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_MEGASPHR:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_wsphr;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_INVUL:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_inv;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_JETPACK:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_jetpack;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_BERSERK:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_meds;
   o.image_single = 2;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  
  case ITEM_BONUSHP:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_bon1;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_BONUSAP:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_bon2;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  
  case ITEM_BACKPACK:
  case ITEM_CLIP:
  case ITEM_BULLETS:
  case ITEM_SHELLS4:
  case ITEM_SHELLS25:
  case ITEM_ROCKET:
  case ITEM_ROCKETS:
  case ITEM_CELL:
  case ITEM_CELLPACK:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_ammo;
   o.image_single = a_obj - 20;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  
  case ITEM_SHOTGUN:
  case ITEM_DSHOTGUN:
  case ITEM_CHAINGUN:
  case ITEM_CHAINSAW:
  case ITEM_RKTLAUNCH:
  case ITEM_PLASMAGUN:
  case ITEM_BFG9000:
  case ITEM_SCHAINGUN:
   o = instance_create(a_x, a_y, o_item);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_weaps;
   o.image_single = a_obj-31;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_INVIS:
    o = instance_create(a_x, a_y, o_item);
    o.o_id = a_obj;
    o.t_id = a_ext;
    o.image_single = 0;
    o.sprite_index = s_vis;
    with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case ITEM_SUIT:
    o = instance_create(a_x, a_y, o_item);
    o.o_id = a_obj;
    o.t_id = a_ext;
    o.image_single = 0;
    o.sprite_index = s_suit;
    with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case AREA_DMPOINT:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.image_single = 0;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case AREA_DMPOINTR:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.image_single = 1;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case AREA_DMPOINTB:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.image_single = 2;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case FLAG_RED:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_flag_r;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case FLAG_BLUE:
   o = instance_create(a_x, a_y, o_spawn);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.sprite_index = s_flag_b;
   with o {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
  break;
  case TRIG_TOUCH:
  case TRIG_USE:
  case TRIG_FIRE:
  case TRIG_START:
  case TRIG_ACTIV:
   o = instance_create(a_x, a_y, o_trigger);
   o.o_id = a_obj;
   o.t_id = a_ext;
   o.timer = 0;
   if o.t_id > 500 {o.timer = o.t_id - 500; o.t_id = TRAC_ACTTRIG;}
   if o.t_id > 100 {o.timer = o.t_id - 100; o.t_id = TRAC_TGLSOLID;}
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
     global.ed_mode = MODE_TRIGZONE;
   }
  break;
}

with (o.object_index) { if id != o.id {o.visible = visible; break;} }

