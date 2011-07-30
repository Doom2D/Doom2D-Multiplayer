//draws background and console
draw_set_font(global.fnt_sys);
draw_set_color(c_white);
draw_set_alpha(0.8);
draw_set_valign(fa_bottom);
draw_text(8, 448, string(con_str + '> ' + keyboard_string + '_'));
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(-1);
