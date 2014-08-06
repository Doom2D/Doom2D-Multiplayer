if global.map_w != 0 || global.dem_mode == 1 {con_add(":: DEMO: В данный момент проигрывание невозможно."); exit;}

if !file_exists(global.dem_fn)
{
  con_add(":: DEMO: Файл не найден: " + global.dem_fn + ".");
  cl_disconnect();
  mus_play(global.mus_menu);
  room_goto(rm_menu);
  exit;
}

con_add(":: DEMO: Проигрывание записи: " + global.dem_fn + ".");
global.dem_mode = 2;
global.dem_b = load_file(global.dem_fn);

if dll39_read_chars(3, global.dem_b) != "DGP" || dll39_read_byte(global.dem_b) != global.dem_ver
{
  con_add(":: DEMO: ERROR: Некорректный файл записи.");
  cl_disconnect(); 
  mus_play(global.mus_menu);
  room_goto(rm_menu); 
  exit;
}

global.dem_size = dll39_buffer_size(global.dem_b);
global.dem_t = dll39_read_ushort(global.dem_b);
global.dem_sz = dll39_read_ushort(global.dem_b);

o_client._dem_time = global.dem_t;
