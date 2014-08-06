//draws text messages
if !global.r_drawhud {exit;}

var text;
text = string(msg_str);
if saymode {text += '#>>> ' + keyboard_string + '_';}

draw_set_font(global.fnt_sys);
draw_set_alpha(0.8);
draw_set_color(msg_color2);
draw_text(view_xview + 10, view_yview + 9, text);
draw_set_color(msg_color);
draw_text(view_xview + 8, view_yview + 8, text);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(-1);
