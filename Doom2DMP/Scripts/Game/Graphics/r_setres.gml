//a0 - w, a1 - h
if !window_get_fullscreen() {exit;}
if !display_test_all(argument0, argument1, -1, -1) 
{
    con_add(":: SYSTEM: ERROR: Указанное разрешение не поддерживается системой. Установлено стандартное.");
    display_set_size(1024, 768);
    global.r_width = 1024;
    global.r_height = 768;
}
else
{
    display_set_size(argument0, argument1);
}
if argument0 <= 1024 && argument1 <= 768 {window_set_region_scale(0, 1);} else {window_set_region_scale(global.r_scale, 1);}
