//checks if player tries to shoot or use something or change weapon
if !variable_global_exists('pl_id') {exit;}
if global.fget_state || global.dem_mode >= 2 {exit;}
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

if keyboard_check_pressed(global.key_chteam)
{
  team_change();
}

if keyboard_check_pressed(global.key_drop)
{
  dll39_write_byte(17, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
}
