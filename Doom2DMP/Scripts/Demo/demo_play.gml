if global.map_w != 0 || global.dem_mode == 1 {con_add(":: DEMO: В данный момент проигрывание невозможно."); exit;}

global.dem_mode = 2;

if !file_exists(global.dem_fn)
{
  con_add(":: DEMO: Файл не найден: " + global.dem_fn + ".");
  cl_disconnect();
  mus_play(global.mus_menu);
  room_goto(rm_menu);
  exit;
}

global.dem_f = dll39_file_open(global.dem_fn, dll39_access_read);
con_add(":: DEMO: Проигрывание записи: " + global.dem_fn + ".");

dll39_buffer_clear(global.dem_b);
dll39_file_read(global.dem_f, 4, global.dem_b);
if dll39_read_chars(3, global.dem_b) != "DGP" || dll39_read_byte(global.dem_b) != global.dem_ver
{
  con_add(":: DEMO: ERROR: Некорректный файл записи.");
  cl_disconnect(); 
  mus_play(global.mus_menu);
  room_goto(rm_menu); 
  exit;
}

dll39_buffer_clear(global.dem_b);

dll39_file_read(global.dem_f, 4, global.dem_b);
global.dem_t = dll39_read_ushort(global.dem_b);
global.dem_sz = dll39_read_ushort(global.dem_b);

o_client._dem_time = global.dem_t;
exit;
