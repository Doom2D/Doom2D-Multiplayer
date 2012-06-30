//a0 - w, a1 - h
if !window_get_fullscreen() {exit;}
if !display_test_all(argument0, argument1, -1, -1) 
{
    con_add(":: SYSTEM: ERROR: Указанное разрешение не поддерживается системой. Установлено наименьшее.");
    global.r_width = 640;
    global.r_height = 480;
    display_set_size(global.r_width, global.r_height);
}
else
{
    display_set_size(argument0, argument1);
}
if argument0 <= 1024 && argument1 <= 768 {window_set_region_scale(0, 1);} else {window_set_region_scale(!global.r_scale, 1);}
