if global.dem_mode == 1
{
  dll39_file_close(global.dem_f);
  file_rename(global.dem_fn, string_replace(global.dem_fn, '#', global.sv_map));
  dll39_buffer_clear(global.dem_b);
  global.dem_f = -1;
  con_add(":: DEMO: Запись остановлена.");
  global.dem_mode = 0;
  exit;
}

if global.map_w != 0 || global.dem_mode == 2
{
  con_add(":: DEMO: ERROR: В данный момент запись невозможна.");
  exit;
}

if !directory_exists('demos\' + global.date_run) { dir_create('demos\' + global.date_run); }
global.dem_fn = 'demos\' + global.date_run + '\[#]' + get_timestamp() + '.dgp';
if file_exists(global.dem_fn) {file_delete(global.dem_fn);}

global.dem_f = dll39_file_open(global.dem_fn, dll39_access_write);

//signature
dll39_buffer_clear(global.dem_b);
dll39_write_chars('DGP', global.dem_b);
dll39_write_byte(global.dem_ver, global.dem_b);
dll39_file_write(global.dem_f, global.dem_b);
dll39_buffer_clear(global.dem_b);

con_add(":: DEMO: Запись...");
global.dem_mode = 1;
exit;
