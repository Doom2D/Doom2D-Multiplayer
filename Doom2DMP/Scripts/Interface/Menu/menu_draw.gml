//draws menu
draw_set_font(global.fnt_big);
draw_text_color(view_xview + 342, view_yview + 340, str[0, 0], c_white, c_white, c_white, c_white, 1); 
draw_set_font(menu_f);
for (i = 1; i < menu_n; i += 1)
{
  if sel == i
  {
    draw_sprite(menu_mrk, image_index, view_xview + 314, view_yview + 355 + menu_spc * i)
    draw_text_color(view_xview + 342, view_yview + 358 + menu_spc * i, str[i, 0], menu_sc, menu_sc, menu_sc, menu_sc, 1); 
  }
  else
  {
    draw_text_color(view_xview + 342, view_yview + 358 + menu_spc * i, str[i, 0], menu_sc, menu_sc, menu_sc, menu_sc, 1); 
  }
  draw_set_halign(fa_right);
  draw_text_color(view_xview + 668, view_yview + 358 + menu_spc * i, str[i, 4], c_white, c_white, c_white, c_white, 1); 
  draw_set_halign(fa_left);
}
draw_set_font(-1);
draw_set_color(c_white);
