//draws background and console
draw_set_font(global.fnt_sys);
draw_set_color(c_white);
draw_set_alpha(0.8);
draw_text(8, yyy, string(con_str));
draw_text(8, 450, '> ' + string(keyboard_string) + '|');
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(-1);
