//draws text messages
draw_set_font(global.fnt_sys);
draw_set_alpha(0.8);
draw_set_color(c_white);
draw_text(8, 8, string(msg_str));
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(-1);
