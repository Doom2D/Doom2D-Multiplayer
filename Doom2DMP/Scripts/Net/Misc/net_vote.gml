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

dyclearbuffer(0);
dywritebyte(15, 0);
dywritebyte(argument1, 0);
dywritestring(_str, 0);
dysendmessage(global.cl_tcp, 0, 0, 0);

