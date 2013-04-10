//a0 - left upper corner x
//a1 - left upper corner y
//a2 - right upper corner x
//a3 - right upper corner y
//a4 - object index
//a5 - texture id
//a6 - object id
var x1, y1, x2, y2, o, oid, t, tw, th, w, h, vis;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
o = argument4;
o_id = argument6;
if o_id < 7 {t = global.tex[argument5];} else {t = s_lifts;}
w = 0;
h = 0;
tw = sprite_get_width(t);
th = sprite_get_height(t);
w = round((x2 - x1)/tw);
h = round((y2 - y1)/th);

if instance_exists(o) {vis = o.visible;} else {vis = true;}

for (a = 0; a != w; a += sign(w))
{
    for (b = 0; b != h; b += sign(h))
    {
        if w >= 0 {ix = x1;} else {ix = x1 - tw;};
        if h >= 0 {iy = y1;} else {iy = y1 - th;};
        i = instance_create(ix + tw * a, iy + th * b, o);
        i.o_id = o_id;
        i.t_id = argument5;
        i.sprite_index = t;
        if o_id < 7 {i.image_single = 0;} else {i.image_single = o_id - 7;}
        i.visible = vis;
    }
}
    
