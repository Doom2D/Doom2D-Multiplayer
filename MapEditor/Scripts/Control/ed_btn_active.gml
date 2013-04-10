if trg != noone && instance_exists(trg)
{
    if global.ed_mode == 1
    {
        trg.image_xscale = (round(floor(mouse_x/global.ed_g_sz)*global.ed_g_sz) + x_off - trg.x)/16;
        trg.image_yscale = (round(floor(mouse_y/global.ed_g_sz)*global.ed_g_sz) + y_off - trg.y)/16;
    }
    if global.ed_mode == 2
    {
        trg.xx[2] = round(floor(mouse_x/global.ed_g_sz)*global.ed_g_sz) + x_off;
        trg.yy[2] = round(floor(mouse_y/global.ed_g_sz)*global.ed_g_sz) + y_off;
    }
    exit;
}

x2 = round(floor(mouse_x/global.ed_g_sz)*global.ed_g_sz);
y2 = round(floor(mouse_y/global.ed_g_sz)*global.ed_g_sz);
