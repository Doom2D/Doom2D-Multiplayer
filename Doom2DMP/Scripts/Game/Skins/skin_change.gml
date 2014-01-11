if is_real(ds_list_find_value(cmd, 1))
{
  con_add(string(global.pl_skin));
  exit;
}
if ds_list_find_value(cmd, 1) == ''
{
  con_add(string(global.pl_skin));
  exit;
}
if room == rm_game
{
  if !variable_global_exists('cl_inst') {exit;}
  if !instance_exists(global.cl_inst) {exit;}
  net_char_look(global.cl_inst.cl_name, string(ds_list_find_value(cmd, 1)), global.cl_inst.cl_color);
  exit;
} 
if !skin_check('data\skins\' + string(ds_list_find_value(cmd, 1)))
{
  con_add(':: ERROR: Скин "' + string(ds_list_find_value(cmd, 1)) + '" не найден, либо он поврежден.');
  exit;
}
global.pl_skin = string(ds_list_find_value(cmd, 1));
//con_add('Скин игрока сменен на ' + string(global.pl_skin) + '.');
