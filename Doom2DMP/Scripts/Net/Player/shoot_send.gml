//checks if player tries to shoot or change weapon or use something
if !variable_global_exists('pl_id') {exit;}
if global.dem_mode >= 2 {exit;}
if global.con || instance_exists(o_menu) || o_con.saymode {exit;}

if keyboard_check(global.key_atk)
{
  dll39_write_byte(6, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
}
if keyboard_check(global.key_use) && !uset
{
  dll39_write_byte(14, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
  uset = 30;
}
