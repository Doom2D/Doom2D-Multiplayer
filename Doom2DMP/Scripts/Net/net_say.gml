//similar to echo but sends to server
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
_str = global.pl_name + ': ';

for (i = 1; i < c + 1; i += 1)
{
    _str += ds_list_find_value(cmd, i) + ' ';
}

dll39_buffer_clear(0);
dll39_write_byte(3, 0);
dll39_write_string(_str, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);


