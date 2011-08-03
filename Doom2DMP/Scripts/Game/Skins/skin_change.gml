if is_real(ds_list_find_value(cmd, 1))
{
  con_add(string(global.pl_skin));
  exit;
}
if ds_list_find_value(cmd, 1) == '' || room == rm_game
{
  con_add(string(global.pl_skin));
  exit;
}
if room == rm_game
{
  con_add(':: WARNING: Нельзя сменить скин игрока в игре.');
  exit;
} 
if !file_exists('data\skins\'+ds_list_find_value(cmd, 1)+'\seeup.tga')
{
  con_add(':: ERROR: Нет такого скина: data\skins\' + string(ds_list_find_value(cmd, 1)) + '!');
  exit;
}
global.pl_skin = string(ds_list_find_value(cmd, 1));
//con_add('Скин игрока сменен на ' + string(global.pl_skin));
