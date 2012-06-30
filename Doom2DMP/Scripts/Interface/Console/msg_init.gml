//inits text messages at the top of the screen
msg_str = '';
msg_color = c_white;
msg_color2 = c_black;
saymode = 0;

for (i = 1; i <= 4; i += 1)
{
    global.hud_text[i, 1] = '';
    global.hud_text[i, 2] = 0;
    global.hud_text[i, 3] = -1;
    global.hud_text[i, 4] = 0;
    global.hud_text[i, 5] = 0;
} //also the hud text
