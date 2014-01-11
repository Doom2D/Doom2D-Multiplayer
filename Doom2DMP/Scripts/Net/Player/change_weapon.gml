if global.dem_mode >= 2 || instance_exists(o_menu) || global.con || o_con.saymode {exit;}
if keyboard_check_pressed(global.key_chw)
{
  dll39_write_byte(7, global.send_buf);
  dll39_write_byte(1, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
}
if keyboard_check_pressed(global.key_chw2)
{
  dll39_write_byte(7, global.send_buf);
  dll39_write_byte(2, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
}
