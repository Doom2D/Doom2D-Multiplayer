//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
prev_cmd = argument0;
cmd = string_explode(argument0, ' ', false); 
if is_real(ds_list_find_value(cmd, 0)){exit;}
if !(ds_list_find_value(cmd, 0) == 'echo' || ds_list_find_value(cmd, 0) == 'say') {con_add('> ' + argument0);}
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
  cfg_write('server.cfg');
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
  if is_real(ds_list_find_value(cmd, 1)) && is_real(ds_list_find_value(cmd, 2)) && is_real(ds_list_find_value(cmd, 3))
  {
    bot_add(bot_select_name(), bot_select_skin(), make_color_rgb(irandom(255), irandom(255), irandom(255)));
  }
  else
  {
    var n, c, s;
    n = string(ds_list_find_value(cmd, 1));
    s = string(ds_list_find_value(cmd, 2));
    if string(ds_list_find_value(cmd, 3)) == '*' {c = make_color_rgb(irandom(255), irandom(255), irandom(255));} else {c = real(string_digits(ds_list_find_value(cmd, 3)));}
    
    if n == '*' || (n != '*' && string_letters(n) == '') {n = bot_select_name();}
    if s == '*' || (s != '*' && string_letters(n) == '') {s = bot_select_skin();}
    
    bot_add(n, s, c);
  }
  exit;
}
if ds_list_find_value(cmd, 0) == 'bot_kick'
{
  with (o_pl)
  {
    if !variable_local_exists('cl_id') {exit;}
    if variable_local_exists('cl_is_bot') {plr_send_kick(cl_id, 'bot_kick()');}
  }
  exit;
}
if ds_list_find_value(cmd, 0) == 'cl_setval'
{
    var ar0, ar1, ar2, inst;
    ar0 = real(string_digits(ds_list_find_value(cmd, 1)));
    if ar0 < 1 || ar0 > 16 {exit;}
    ar1 = string(ds_list_find_value(cmd, 2));
    ar2 = real(string_digits(ds_list_find_value(cmd, 3)));
    if string_digits(ds_list_find_value(cmd, 3)) == '' {exit;}
    if ar1 == '' || ar1 == '0' {exit;}
    if ar1 == 'help' {con_add(':: cl_setval(): Следующие параметры могут быть изменены:#hp ap frag inv ber bpk jet w2 w3 w4 w5 w6 w7 w8 w9 a1 a2 a3 a4.'); exit;}
    inst = id_to_cl(ar0);
    if !instance_exists(inst) {exit;}
    switch ar1
    {
        case 'hp':
            inst.hp = ar2;
        break;
        case 'ap':
            inst.ap = ar2;
        break;
        case 'frag':
            inst.frag = ar2;
        break;
        case 'jet':
            inst.st_jet = max(1, ar2);
        break;
        case 'inv':
            inst.st_inv = max(1, ar2);
        break;
        case 'ber':
            inst.st_ber = max(1, ar2);
        break;
        case 'bpk':
            inst.st_bpk = max(1, ar2);
        break;
        case 'w2':
            inst.hw[2] = max(1, ar2);
        break;
        case 'w3':
            inst.hw[3] = max(1, ar2);
        break;
        case 'w4':
            inst.hw[4] = max(1, ar2);
        break;
        case 'w5':
            inst.hw[5] = max(1, ar2);
        break;
        case 'w6':
            inst.hw[6] = max(1, ar2);
        break;
        case 'w7':
            inst.hw[7] = max(1, ar2);
        break;
        case 'w8':
            inst.hw[8] = max(1, ar2);
        break;
        case 'w9':
            inst.hw[9] = max(1, ar2);
        break;
        case 'a1':
            inst.a1 = ar2;
        break;
        case 'a2':
            inst.a2 = ar2;
        break;
        case 'a3':
            inst.a3 = ar2;
        break;
        case 'a4':
            inst.a4 = ar2;
        break;
        default:
            con_add(':: ERROR: Неизвестный параметр.');
    }
    with (inst) {plr_send_stat();}
    exit;
}
if (string_count('sv_', ds_list_find_value(cmd, 0)) > 0 || string_count('bot_', ds_list_find_value(cmd, 0)) > 0 || string_count('cl_', ds_list_find_value(cmd, 0)) > 0 || string_count('mp_', ds_list_find_value(cmd, 0)) > 0) && !(ds_list_find_value(cmd, 0) == 'sv_map' || ds_list_find_value(cmd, 0) = 'sv_password' || ds_list_find_value(cmd, 0) = 'sv_rcon_pwd' || ds_list_find_value(cmd, 0) = 'sv_name' || ds_list_find_value(cmd, 0) = 'sv_welcome' || ds_list_find_value(cmd, 0) = 'sv_slist' || ds_list_find_value(cmd, 0) = 'sv_ip' || ds_list_find_value(cmd, 0) = 'sv_slist_path' || ds_list_find_value(cmd, 0) = 'cl_setval')
{
  con_parse_cvar(ds_list_find_value(cmd, 0), ds_list_find_value(cmd, 1));
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_map'
{
  if is_real(ds_list_find_value(cmd, 1)) {con_add(global.sv_map); exit;}
  if !file_exists('data\maps\' + ds_list_find_value(cmd, 1) + '.dlv') {con_add(":: ERROR: Нет такой карты."); exit;}
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
if ds_list_find_value(cmd, 0) == 'sv_slist_path'
{
  if is_real(ds_list_find_value(cmd, 1)) {con_add(global.sv_slist_path); exit;}
  global.sv_slist_path = ds_list_find_value(cmd, 1);
  exit;
}

if ds_list_find_value(cmd, 0) == 'resync'
{
  o_host.alarm[1] = 1;
  exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)));

