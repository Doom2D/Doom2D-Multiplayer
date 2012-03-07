//slects spr to draw
var sl;
sl = API_Combobox_GetSel(ui_tl_cb);
tx = API_Combobox_GetSel(ui_tx_cb);
if tx < 0 {tx = 0}

switch sl
{
  case 0:
   spr = global.tex[tx];
   col = c_white;
  break;
  case 1:
   spr = global.tex[tx];
   col = c_orange; 
  break;
  case 2:
   spr = global.tex[tx];
   col = c_maroon;
  break;
  case 3:
   spr = global.tex[tx];
   col = c_purple;
  break;
  case 4:
   spr = global.tex[tx];
   col = c_green;
  break;
  case 5:
   spr = global.tex[tx];
   col = c_green;
  break;
  case 6:
   spr = global.tex[tx];
   col = c_green;
  break;
  case 7:
   spr = s_lifts;
   col = c_yellow;
   im = 0;
  break;
  case 8:
   spr = s_lifts;
   col = c_yellow;
   im = 1;
  break;
  case 9:
   spr = s_lifts;
   col = c_yellow;
   im = 2;
  break;
  case 10:
   spr = s_lifts;
   col = c_yellow;
   im = 3;
  break;
  case 11:
   spr = s_meds;
   im = 0;
  break;
  case 12:
   spr = s_meds;
   im = 1;
  break;
  case 13:
   spr = s_armor1;
   im = 0;
  break;
  case 14:
   spr = s_armor2;
   im = 0;
  break;
  case 15:
   spr = s_bsphr;
   im = 0;
  break;
  case 16:
   spr = s_wsphr;
   im = 0;
  break;
  case 17:
   spr = s_inv;
   im = 0;
  break;
  case 18:
   spr = s_jetpack;
   im = 0;
  break;
  case 19:
   spr = s_meds;
   im = 2;
  break;
  
  case 25:
   spr = s_bon1;
   im = 0;
  break;
  case 26:
   spr = s_bon2;
   im = 0;
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
   spr = s_ammo;
   im = sl - 20;
  break;
  
  case 31:
  case 32:
  case 33:
  case 34:
  case 35:
  case 36:
  case 37:
  case 38:
   spr = s_weaps;
   im = sl - 31;
  break;
  case 39:
   spr = s_spawn;
   im = sl;
  break;
}

if mouse_check_button(mb_right) {col = c_red;}

th = sprite_get_height(spr);
tw = sprite_get_width(spr);
