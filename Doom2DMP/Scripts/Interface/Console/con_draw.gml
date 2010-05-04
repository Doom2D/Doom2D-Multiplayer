//draws background and console
draw_set_font(global.fnt_sys);
draw_set_alpha(0.8);
draw_set_color(c_white);
draw_background_stretched(bkg_console, 0, 0, 1024, 320);
draw_text(8, yyy, string(con_str));
draw_text(8, 300, '> ' + string(keyboard_string) + '|');
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(-1);
