//draws text messages
if !global.r_drawhud {exit;}
draw_set_font(global.fnt_sys);
draw_set_alpha(0.8);
draw_set_color(msg_color2);
if !saymode {draw_text(view_xview + 11, view_yview + 11, string(msg_str));} else {draw_text(view_xview + 11, view_yview + 11, string(msg_str + '#>>> ' + keyboard_string + '_'));}
draw_set_color(msg_color);
if !saymode {draw_text(view_xview + 8, view_yview + 8, string(msg_str));} else {draw_text(view_xview + 8, view_yview + 8, string(msg_str + '#>>> ' + keyboard_string + '_'));}
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(-1);
