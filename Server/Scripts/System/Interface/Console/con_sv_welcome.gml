//changes server greeting
if global.map_w > 0 {con_add('Сейчас нельзя изменить этот параметр.'); exit;}
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

global.sv_welcome = _str;
con_add('sv_welcome' + ' = ' + global.sv_welcome);
