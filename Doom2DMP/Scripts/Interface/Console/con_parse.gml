//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
cmd = string_explode(argument0, ' ', false);
if is_real(ds_list_find_value(cmd, 0)){exit;}
if ds_list_find_value(cmd, 0) == 'help'
{
  con_add('==Доступные команды===');
  con_add('help - выводит этот список');
  con_add('name NAME - изменяет имя игрока на NAME');
  con_add('color COLOR - изменяет цвет игрока на COLOR (только в меню)');
  con_add('skin SKIN - изменяет скин игрока на SKIN (только в меню)');
  con_add('bind KEY COMMAND - вешает команду COMMAND на клавишу KEY');
  con_add('bind_info - выводит инфу об управлении');
  con_add('exec CONF - загружает конфигурацию из файла data\cfg\CONF.cfg');
  con_add('echo STR - пишет в консоль строку STR');
  con_add('exit/quit - выход из игры');
  con_add('======================');
  exit;
}
if ds_list_find_value(cmd, 0) == 'exit' or ds_list_find_value(cmd, 0) == 'quit'
{
  game_end();
  exit;
}
if ds_list_find_value(cmd, 0) == 'name'
{
  if is_real(ds_list_find_value(cmd, 1))
  {
    con_add(string(global.pl_name));
    exit;
  } 
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(global.pl_name));
    exit;
  } 
  global.pl_name = string(ds_list_find_value(cmd, 1));
  con_add('Теперь игрока зовут ' + string(global.pl_name));
  exit;
}
if ds_list_find_value(cmd, 0) == 'color'
{
  color_change();
  exit;
}
if ds_list_find_value(cmd, 0) == 'skin'
{
  skin_change();
  exit;
}
if ds_list_find_value(cmd, 0) == 'exec'
{
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
  cfg_load(string(ds_list_find_value(cmd, 1)));
  exit;
}
if ds_list_find_value(cmd, 0) == 'echo'
{
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
  con_add(string(ds_list_find_value(cmd, 1)));
  exit;
}
if ds_list_find_value(cmd, 0) == 'bind'
{
  key_bind(ds_list_find_value(cmd, 1), ds_list_find_value(cmd, 2));
  exit;
}
if ds_list_find_value(cmd, 0) == 'bind_info'
{
  bind_info();
  exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)) + '. Введите help для списка команд.');
