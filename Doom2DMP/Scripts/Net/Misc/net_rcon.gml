//similar to echo and say but sends commands to server
if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}

if is_real(ds_list_find_value(cmd, 1))
{
  con_add('Недопустимое значение аргумента.');
  exit;
}
if ds_list_find_value(cmd, 1) == ''
{
  con_add('Недопустимое значение аргумента.');
  exit;
}

c = string_count(' ', argument0);
_str = '';

for (i = 1; i < c + 1; i += 1)
{
  if !is_real(ds_list_find_value(cmd, i)) {_str += string(ds_list_find_value(cmd, i)) + ' ';}
}

dll39_write_byte(8, global.send_buf);
dll39_write_string(_str, global.send_buf);
dll39_write_string(global.sv_rcon_pwd, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);

