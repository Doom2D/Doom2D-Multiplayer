if global.dem_mode != 2 {exit;}

dll39_buffer_free(global.dem_b);
dll39_buffer_clear(dll39_default_buffer);
skin_release(o_pl);

global.dem_fn = '';
global.dem_mode = 3;
global.dem_pause = 0;

con_add(":: DEMO: Проигрывание завершено.");
