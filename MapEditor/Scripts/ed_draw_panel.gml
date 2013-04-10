//draws the temp shit
draw_set_color(c_white);
draw_set_alpha(1);

w = round((x2 - x1)/tw);
h = round((y2 - y1)/th);

for (a = 0; a != w; a += sign(w))
{
    for (b = 0; b != h; b += sign(h))
    {
        if w >= 0 {ix = x1;} else {ix = x1 - tw;};
        if h >= 0 {iy = y1;} else {iy = y1 - th;};
        if !mouse_check_button(mb_right) {draw_sprite_ext(spr, im, ix + tw * a, iy + th * b, 1, 1, 0, c_white, 0.5);}
    }
}

draw_set_color(col);
draw_rectangle(x1, y1, x2, y2, 1);
draw_set_color(c_white);
