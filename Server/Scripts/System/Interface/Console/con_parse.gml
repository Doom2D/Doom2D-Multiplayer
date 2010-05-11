//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
cmd = string_explode(argument0, ' ', false);
if is_real(ds_list_find_value(cmd, 0)){exit;}
if ds_list_find_value(cmd, 0) == 'help'
{
  con_add('==Доступные команды===');
  con_add('help - выводит этот список');
  con_add('exit/quit - убить сервер');
  con_add('======================');
  exit;
}
if ds_list_find_value(cmd, 0) == 'exit' or ds_list_find_value(cmd, 0) == 'quit'
{
  game_end();
  exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)) + '. Введите help для списка команд.');
