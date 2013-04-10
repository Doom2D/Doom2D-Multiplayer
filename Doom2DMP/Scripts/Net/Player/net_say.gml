//similar to echo but sends to server
if global.dem_mode >= 2 {exit;}
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
    if !is_real(ds_list_find_value(cmd, i)) {_str += string(ds_list_find_value(cmd, i)) + ' ';}
}

dyclearbuffer(0);
dywritebyte(3, 0);
dywritestring(_str, 0);
dysendmessage(global.cl_tcp, 0, 0, 0);


