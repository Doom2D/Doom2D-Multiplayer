if is_real(ds_list_find_value(cmd, 1)) || string_letters(ds_list_find_value(cmd, 1)) != ''
{
  con_add(string(global.pl_color));
  exit;
} 
if is_real(ds_list_find_value(cmd, 2)) || string_letters(ds_list_find_value(cmd, 2)) != ''
{
  con_add(string(global.pl_color));
  exit;
} 
if is_real(ds_list_find_value(cmd, 3)) || string_letters(ds_list_find_value(cmd, 3)) != ''
{
  con_add(string(global.pl_color));
  exit;
} 
if room == rm_game
{
  if !variable_global_exists('cl_inst') {exit;}
  if !instance_exists(global.cl_inst) {exit;}
  net_char_look(global.cl_inst.cl_name, global.cl_inst.cl_skin, make_color_rgb(real(ds_list_find_value(cmd, 1)),real(ds_list_find_value(cmd, 2)),real(ds_list_find_value(cmd, 3))));
  exit;
}
global.pl_color = make_color_rgb(real(ds_list_find_value(cmd, 1)),real(ds_list_find_value(cmd, 2)),real(ds_list_find_value(cmd, 3)));
//con_add('Теперь игрок имеет цвет ' + string(global.pl_color));

