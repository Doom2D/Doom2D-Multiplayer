//similar to echo and say but sends commands to server
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

dll39_buffer_clear(0);
dll39_write_byte(8, 0);
dll39_write_string(_str, 0);
dll39_write_string(global.sv_rcon_pwd, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);


