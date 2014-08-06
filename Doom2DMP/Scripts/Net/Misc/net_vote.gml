//voting system

if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}

if !argument1
{
  if is_real( ds_list_find_value(cmd, 1) ) { con_add('Недопустимое значение аргумента.'); exit; }
  if ds_list_find_value(cmd, 1) == ''      { con_add('Недопустимое значение аргумента.'); exit; }
}

var str, c;
str = '';
c = string_count(' ', argument0);

for (i = 1; i < c + 1; i += 1)
{
  if !is_real( ds_list_find_value(cmd, i) ) { str += string( ds_list_find_value(cmd, i) ) + ' '; }
}

dll39_write_byte(15, global.send_buf);
dll39_write_byte(argument1, global.send_buf);
dll39_write_string(str, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);
