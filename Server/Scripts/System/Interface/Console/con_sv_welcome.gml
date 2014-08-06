//changes server greeting

if is_real( ds_list_find_value(cmd, 1) ) { con_add('Недопустимое значение аргумента.'); exit; }
if ds_list_find_value(cmd, 1) == ''      { con_add('Недопустимое значение аргумента.'); exit; }

var str, c;
str = '';
c = string_count(' ', argument0);

for (i = 1; i < c + 1; i += 1)
{
  if !is_real( ds_list_find_value(cmd, i) ) { str += string( ds_list_find_value(cmd, i) ) + ' '; }
}

global.sv_welcome = str;
con_add('sv_welcome = ' + global.sv_welcome);
