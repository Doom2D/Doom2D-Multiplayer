if global.dem_mode != 2 {exit;}

if dll39_get_pos(true, global.dem_b) >= global.dem_size
{
  cl_disconnect();
  mus_play(global.mus_menu);
  room_goto(rm_menu);
  exit;
}

dll39_buffer_clear(dll39_default_buffer);
dll39_buffer_copy2(dll39_default_buffer, dll39_get_pos(true, global.dem_b), global.dem_sz, global.dem_b);
dll39_set_pos(dll39_get_pos(true, global.dem_b) + global.dem_sz, global.dem_b);

global.dem_t = dll39_read_ushort(global.dem_b);
global.dem_sz = dll39_read_ushort(global.dem_b);

if global.dem_t > 1024
{
  cl_disconnect();
  mus_play(global.mus_menu);
  room_goto(rm_menu);
  exit;
}

o_client._dem_time = global.dem_t;
