//voting system
if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}

if is_real(ds_list_find_value(cmd, 1)) && !argument1
{
    con_add('Недопустимое значение аргумента.');
    exit;
}
if string(ds_list_find_value(cmd, 1)) == '' && !argument1
{
    con_add('Недопустимое значение аргумента.');
    exit;
}

var c, _str;

c = string_count(' ', argument0);
_str = '';

for (i = 1; i < c + 1; i += 1)
{
    if !is_real(ds_list_find_value(cmd, i)) {_str += string(ds_list_find_value(cmd, i)) + ' ';}
}

dll39_write_byte(15, global.send_buf);
dll39_write_byte(argument1, global.send_buf);
dll39_write_string(_str, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);

