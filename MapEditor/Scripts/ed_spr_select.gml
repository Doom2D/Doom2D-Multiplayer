//selects sprite to draw

switch obj_sel
{
  case BLOCK_SOLID:
   spr = global.tex[tex_sel];
   col = c_white;
  break;
  case BLOCK_JTHR:
   spr = global.tex[tex_sel];
   col = c_orange; 
  break;
  case BLOCK_BKG:
   spr = global.tex[tex_sel];
   col = c_maroon;
  break;
  case BLOCK_FRG:
   spr = global.tex[tex_sel];
   col = c_purple;
  break;
  case BLOCK_WATER:
   spr = global.tex[tex_sel];
   col = c_green;
  break;
  case BLOCK_ACID1:
   spr = global.tex[tex_sel];
   col = c_green;
  break;
  case BLOCK_ACID2:
   spr = global.tex[tex_sel];
   col = c_green;
  break;
  case BLOCK_LIFTU:
   spr = s_lifts;
   col = c_yellow;
   im = 0;
  break;
  case BLOCK_LIFTD:
   spr = s_lifts;
   col = c_yellow;
   im = 1;
  break;
  case BLOCK_LIFTL:
   spr = s_lifts;
   col = c_yellow;
   im = 2;
  break;
  case BLOCK_LIFTR:
   spr = s_lifts;
   col = c_yellow;
   im = 3;
  break;
  case ITEM_STIMPACK:
   spr = s_meds;
   im = 0;
  break;
  case ITEM_MEDKIT:
   spr = s_meds;
   im = 1;
  break;
  case ITEM_ARMOR1:
   spr = s_armor1;
   im = 0;
  break;
  case ITEM_ARMOR2:
   spr = s_armor2;
   im = 0;
  break;
  case ITEM_SOULSPHR:
   spr = s_bsphr;
   im = 0;
  break;
  case ITEM_MEGASPHR:
   spr = s_wsphr;
   im = 0;
  break;
  case ITEM_INVUL:
   spr = s_inv;
   im = 0;
  break;
  case ITEM_JETPACK:
   spr = s_jetpack;
   im = 0;
  break;
  case ITEM_BERSERK:
   spr = s_meds;
   im = 2;
  break;
  
  case ITEM_BONUSHP:
   spr = s_bon1;
   im = 0;
  break;
  case ITEM_BONUSAP:
   spr = s_bon2;
   im = 0;
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
   spr = s_ammo;
   im = obj_sel - 20; //20 is the index of ITEM_BACKPACK
  break;
  
  case ITEM_SHOTGUN:
  case ITEM_DSHOTGUN:
  case ITEM_CHAINGUN:
  case ITEM_CHAINSAW:
  case ITEM_RKTLAUNCH:
  case ITEM_PLASMAGUN:
  case ITEM_BFG9000:
  case ITEM_SCHAINGUN:
   spr = s_weaps;
   im = obj_sel - 31;
  break;
  case ITEM_INVIS:
    spr = s_vis;
    im = 0;
  break;  
  case ITEM_SUIT:
    spr = s_suit;
    im = 0;
  break;

  case AREA_DMPOINT:
   spr = s_spawn;
   im = 0;
  break;
  case AREA_DMPOINTR:
   spr = s_spawn;
   im = 1;
  break;
  case AREA_DMPOINTB:
   spr = s_spawn;
   im = 2;
  break;
  case FLAG_RED:
   spr = s_flag_r;
   im = 0;
  break;
  case FLAG_BLUE:
   spr = s_flag_b;
   im = 0;
  break;
  
  case TRIG_TOUCH:
  case TRIG_USE:
  case TRIG_FIRE:
  case TRIG_START:
  case TRIG_ACTIV:
   spr = s_point;
   im = obj_sel - 44; //44 is the index of TRIG_TOUCH
  break;
}

if obj_wblock(obj_sel) {API_Control_Enable(ui_tx_cb, true); API_Control_Enable(ui_tg_cb, false);}
if obj_trig(obj_sel) {API_Control_Enable(ui_tx_cb, false); API_Control_Enable(ui_tg_cb, true);}
if obj_lift(obj_sel) || obj_item(obj_sel) || obj_area(obj_sel) || obj_flag(obj_sel)
{
  API_Control_Enable(ui_tx_cb, false); API_Control_Enable(ui_tg_cb, false);
  if keyboard_check(ord('V'))
  {
    var obj_w;
    obj_w = obj_get_w(obj_sel);
    if !keyboard_check(ord('C')) || !keyboard_check(ord('B')) {ix_off = round(obj_w / 2);}
    if keyboard_check(ord('C')) {ix_off = ceil( ceil(obj_w / global.ed_g_sz) / 2 ) * global.ed_g_sz;}
    if keyboard_check(ord('B')) {ix_off = obj_w - ceil( ceil(obj_w / global.ed_g_sz) / 2 ) * global.ed_g_sz;}
    iy_off = obj_get_h(obj_sel) mod global.ed_g_sz;
  } else {
    ix_off = 0;
    iy_off = 0;
  }
} else {
  ix_off = 0;
  iy_off = 0;
}
if global.ed_mode == MODE_NORMAL
{
  API_Control_Enable(ui_tl_cb, true);
  API_Menu_SetItemEnabled(ui_mbar_m1_save, true);
  API_Menu_SetItemEnabled(ui_mbar_m1_saveas, true);
  API_Menu_SetItemEnabled(ui_mbar_m3_reinit, true)
} else {
  API_Control_Enable(ui_tl_cb, false);
  API_Menu_SetItemEnabled(ui_mbar_m1_save, false);
  API_Menu_SetItemEnabled(ui_mbar_m1_saveas, false);
  API_Menu_SetItemEnabled(ui_mbar_m3_reinit, false);
}
if mouse_check_button(mb_right) {col = c_red;}

th = sprite_get_height(spr);
tw = sprite_get_width(spr);
