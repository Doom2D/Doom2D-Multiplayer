if trg != noone && instance_exists(trg)
{
    if global.ed_mode == 2
    {
        trg.xx[1] = round(floor(mouse_x/global.ed_g_sz)*global.ed_g_sz) + x_off;
        trg.yy[1] = round(floor(mouse_y/global.ed_g_sz)*global.ed_g_sz) + y_off;
        if trg.t_id == 7
        {
            trg = noone;
            global.ed_mode = 0;
        }
    }
    exit;
}

var sl;
sl = API_Combobox_GetSel(ui_tl_cb);
x1 = round(floor(mouse_x/global.ed_g_sz)*global.ed_g_sz);
y1 = round(floor(mouse_y/global.ed_g_sz)*global.ed_g_sz);
if !keyboard_check(vk_shift) 
{
    x1 = round(floor(mouse_x/global.ed_g_sz)*global.ed_g_sz) + x_off;
    y1 = round(floor(mouse_y/global.ed_g_sz)*global.ed_g_sz) + y_off;
    map_obj_create(sl, tx, x1, y1, 0, 0, x1, y1, x1, y1);
}
