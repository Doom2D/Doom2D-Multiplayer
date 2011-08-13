//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
prev_cmd = argument0;
cmd = string_explode(argument0, ' ', false); 
if is_real(ds_list_find_value(cmd, 0)){exit;}
con_add('> ' + argument0);
if ds_list_find_value(cmd, 0) == 'help'
{
  con_add('==Базовые команды===');
  con_add('help - выводит этот список');
  con_add('clist - вывести список клиентов');
  con_add('kick ID - кикнуть клиента из слота ID');
  con_add('ban ID - внести IP клиента из слота ID в банлист');
  con_add('ban_reload - перезагрузить банлист');
  con_add('sv_map MAP - кикнуть всех клиентов и сменить карту на MAP');
  con_add('say STR - отослать клиентам сообщение STR');
  con_add('echo STR - вывести текст STR');
  con_add('exit/quit - выключить сервер');
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
  con_echo();
  exit;
}
if ds_list_find_value(cmd, 0) == 'say'
{
  net_say();
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_name'
{
  con_sv_name();
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_welcome'
{
  con_sv_welcome();
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
if ds_list_find_value(cmd, 0) == 'bot_add'
{
  bot_add();
  exit;
}
if (string_count('sv_', ds_list_find_value(cmd, 0)) > 0 || string_count('bot_', ds_list_find_value(cmd, 0)) > 0 || string_count('cl_', ds_list_find_value(cmd, 0)) > 0 || string_count('mp_', ds_list_find_value(cmd, 0)) > 0) && !(ds_list_find_value(cmd, 0) == 'sv_map' || ds_list_find_value(cmd, 0) = 'sv_password' || ds_list_find_value(cmd, 0) = 'sv_rcon_pwd' || ds_list_find_value(cmd, 0) = 'sv_name' || ds_list_find_value(cmd, 0) = 'sv_welcome' || ds_list_find_value(cmd, 0) = 'sv_slist')
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
    old = global.sv_cycle_maps;
    global.sv_cycle_maps = 1;
    with (o_pl) {plr_send_gameover();}
    global.sv_cycle_maps = old;
    global.sv_map = ds_list_find_value(cmd, 1);
    cfg_write('server.cfg');
    sleep(60);
    if file_exists("Server.exe") {execute_program('Server.exe', -1, 0);}
    if file_exists("d2dmp_sv.exe") {execute_program('d2dmp_sv.exe', -1, 0);}
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
if ds_list_find_value(cmd, 0) == 'ban'
{
  if is_real(ds_list_find_value(cmd, 1)) || string_letters(ds_list_find_value(cmd, 1)) != '' {exit;}
  _id = real(ds_list_find_value(cmd, 1));
  net_ban(_id);
  exit;
}
if ds_list_find_value(cmd, 0) == 'ban_reload'
{
  ds_list_destroy(global.ban_list);
  global.ban_list = -1;
  list_load('data\cfg\ip_bans.txt', 'ban_list');
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_rcon_pwd'
{
  if is_real(ds_list_find_value(cmd, 1)) {con_add(global.sv_rcon_pwd); exit;}
  global.sv_rcon_pwd = string_delete(ds_list_find_value(cmd, 1), 9, string_length(ds_list_find_value(cmd, 1)));
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_password'
{
  if is_real(ds_list_find_value(cmd, 1)) {con_add(global.sv_password); exit;}
  global.sv_password = string_delete(ds_list_find_value(cmd, 1), 9, string_length(ds_list_find_value(cmd, 1)));
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_slist'
{
  if is_real(ds_list_find_value(cmd, 1)) {con_add(global.sv_slist); exit;}
  global.sv_slist = ds_list_find_value(cmd, 1);
  exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)));

