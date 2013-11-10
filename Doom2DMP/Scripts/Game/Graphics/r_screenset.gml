if global.r_fskip
{
    set_automatic_draw(false);
    o_con.alarm[11] = 1;
} else {
    o_con.alarm[11] = 0;
    set_automatic_draw(true);
}

if global.r_fps_correct
{
    o_con.alarm[10] = 1;
} else {
    o_con.alarm[10] = 0;
    room_speed = global.cl_fps_max
}

window_set_fullscreen(!global.r_window);

if window_get_fullscreen()
{
    if !display_test_all(global.r_width, global.r_height, -1, global.r_depth)
    {
      con_add(":: SYSTEM: ERROR: Видеорежим не поддерживается системой. Установлен стандартный.");
      global.r_width = 800;
      global.r_height = 600;
      global.r_depth = display_get_colordepth();
    }
    display_set_all(global.r_width, global.r_height, -1, global.r_depth);

    if global.r_width <= 1024 && global.r_height <= 768
    {
      window_set_region_scale(false, true);
    } else {
      window_set_region_scale(!global.r_scale, true);
    }
} else {
    display_reset();
    window_center();
    if !display_test_all(-1, -1, -1, global.r_depth)
    {
      con_add(":: SYSTEM: ERROR: Указанная глубина цвета не поддерживается системой. Установлена системная.");
      global.r_depth = display_get_colordepth();
    } else {
      if global.r_depth != display_get_colordepth() {display_set_colordepth(global.r_depth);}
    }
    window_set_region_scale(false, true);
}

set_synchronization(global.r_vsync);
if room == rm_menu {room_restart();}
