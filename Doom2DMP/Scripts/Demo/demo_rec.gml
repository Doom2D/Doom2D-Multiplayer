if global.dem_mode == 1
{  
  if !directory_exists('demos\' + global.date_run) { dir_create('demos\' + global.date_run); }

  var dem_fn, dem_f;
  dem_fn = filename_uniq( 'demos\'                   +
                          global.date_run            +
                          '\[' + global.sv_map + ']' +
                          global.dem_time            , '.dgp' );

  dem_f = dll39_file_open(dem_fn, dll39_access_write);
  dll39_file_write(dem_f, global.dem_b);
  dll39_file_close(dem_f);

  dll39_buffer_free(global.dem_b);
  global.dem_mode = 0;
  con_add(":: DEMO: Запись остановлена.");
  exit;
}

if global.map_w != 0 || global.dem_mode == 2
{
  con_add(":: DEMO: ERROR: В данный момент запись невозможна.");
  exit;
}

con_add(":: DEMO: Запись...");
global.dem_mode = 1;
global.dem_time = get_timestamp();
global.dem_b = dll39_buffer_create();

//signature
dll39_write_chars('DGP', global.dem_b);
dll39_write_byte(global.dem_ver, global.dem_b);
