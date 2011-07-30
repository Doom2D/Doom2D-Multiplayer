//draws background and console
draw_set_font(global.fnt_sys);
draw_set_color(c_white);
draw_set_alpha(0.6);
draw_background_stretched(bkg_console, view_xview, view_yview, 1024, 320);
draw_set_valign(fa_bottom);
draw_text(view_xview + 8, view_yview + 316, string(con_str + '> ' + keyboard_string + '_'));
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(-1);
