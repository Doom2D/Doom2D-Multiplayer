if global.dem_mode != 2 {exit;}

if dll39_file_pos(global.dem_f) >= dll39_file_size(global.dem_f) - 1
{
  con_parse('disconnect');
  exit;
}

dll39_buffer_clear(dll39_default_buffer);
dll39_file_read(global.dem_f, global.dem_sz, dll39_default_buffer);

dll39_buffer_clear(global.dem_b);
dll39_file_read(global.dem_f, 4, global.dem_b);

global.dem_t = dll39_read_ushort(global.dem_b);
global.dem_sz = dll39_read_ushort(global.dem_b);

if global.dem_t > 1024
{
  con_parse("disconnect");
  exit;
}

o_client._dem_time = global.dem_t;
