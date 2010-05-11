//draws menu
draw_set_font(menu_f);
for (i = 1; i < menu_n+1; i += 1)
{
  if sel == i
  {
    draw_sprite(s_marker, image_index, 384-48, 400 + 32*(i-1))
    draw_text_color(384-16, 384 + 32*(i-1), str[i, 0], menu_sc, menu_sc, menu_sc, menu_sc, 1); 
  }
  else
  {
    draw_text_color(384-16, 384 + 32*(i-1), str[i, 0], menu_sc, menu_sc, menu_sc, menu_sc, 1); 
  }
}
draw_set_font(-1);
