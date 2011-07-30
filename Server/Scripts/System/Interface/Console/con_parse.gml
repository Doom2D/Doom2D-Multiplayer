//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
cmd = string_explode(argument0, ' ', false);
if is_real(ds_list_find_value(cmd, 0)){exit;}
if ds_list_find_value(cmd, 0) == 'help'
{
  con_add('==Базовые команды===');
  con_add('help - выводит этот список');
  con_add('cfg_exec CONF - загружает конфигурацию из файла data\cfg\CONF.cfg');
  con_add('cfg_save CONF - сохраняет настройки в файл data\cfg\CONF.cfg');
  con_add('echo А - вывести текст А');
  con_add('exit/quit - убить сервер');
  con_add('======================');
  exit;
}
if ds_list_find_value(cmd, 0) == 'exit' or ds_list_find_value(cmd, 0) == 'quit'
{
  game_end();
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
if ds_list_find_value(cmd, 0) == 'clist'
{
  con_add('==CONNECTED CLIENTS==');
  con_add('   (ID, name, IP)   ');
  net_list_clients();
  con_add('=====================');
  exit;
}
if ds_list_find_value(cmd, 0) == 'ban'
{
  con_add('Not implemented yet.');
  exit;
}
if ds_list_find_value(cmd, 0) == 'bot_add'
{
  bot_add();
  exit;
}
if ds_list_find_value(cmd, 0) == 'fps'
{
  con_add(string(fps));
  exit;
}
if (string_count('sv_', ds_list_find_value(cmd, 0)) > 0 || string_count('bot_', ds_list_find_value(cmd, 0)) > 0 || string_count('cl_', ds_list_find_value(cmd, 0)) > 0 || string_count('mp_', ds_list_find_value(cmd, 0)) > 0) && !(ds_list_find_value(cmd, 0) == 'sv_map' || ds_list_find_value(cmd, 0) = 'sv_password' || ds_list_find_value(cmd, 0) = 'sv_rcon_pwd' || ds_list_find_value(cmd, 0) = 'sv_name')
{
  con_parse_cvar(ds_list_find_value(cmd, 0), ds_list_find_value(cmd, 1));
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_map'
{
  if ds_list_find_value(cmd, 1) == '' || is_real(ds_list_find_value(cmd, 0)) {exit;}
  if !file_exists('data\maps\' + ds_list_find_value(cmd, 1) + '.dlv') {exit;}
  if global.map_w != 0 
  {
    with (o_pl) {plr_send_kick(cl_id, 'Server is changing map.');}
    global.sv_map = ds_list_find_value(cmd, 1);
    cfg_write('server.cfg');
    sleep(60);
    execute_program('d2dmp_sv.exe', -1, 0);
    game_end();
    exit;
  }
  global.sv_map = ds_list_find_value(cmd, 1);
  exit;
}
if ds_list_find_value(cmd, 0) == 'kick'
{
  if is_real(ds_list_find_value(cmd, 1)) || string_letters(ds_list_find_value(cmd, 1)) != '' {exit;}
  _id = real(ds_list_find_value(cmd, 1));
  plr_send_kick(_id, 'Kicked by console.');
  exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)));

