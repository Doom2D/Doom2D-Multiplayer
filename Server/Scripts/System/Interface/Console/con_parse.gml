//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
if string_copy(string(argument0), 1, 1) == ';' {exit;}
prev_cmd = argument0;
cmd = string_explode(argument0, ' ', false); 
if is_real(ds_list_find_value(cmd, 0)){exit;}
ds_list_replace(cmd, 0, string_lower(ds_list_find_value(cmd, 0)));
if !(ds_list_find_value(cmd, 0) == 'echo' || ds_list_find_value(cmd, 0) == 'say') {con_add('> ' + argument0);}
if ds_list_find_value(cmd, 0) == 'help'
{
  con_add('========================');
  con_add('cfg_save NAME - сохранить конфигурацию в файл NAME.cfg');
  con_add('cfg_load NAME - загрузить конфигурацию из файла NAME.cfg');
  con_add('restart - перезапустить сервер');
  con_add('exit/quit/die - выключить сервер');
  con_add('ban_reload - перезагрузить банлист');
  con_add('ban X - занести IP клиента из слота X в банлист');
  con_add('kick X - отключить клиента из слота X');
  con_add('bot_kick - удалить всех ботов с сервера')
  con_add('bot_add - добавить бота на сервер')
  con_add('say STR - написать строку STR в чат');
  con_add('sv_map MAP - сменить карту на MAP.dlv');
  con_add('help - вывести данный список');
  con_add('echo STR - вывести строку STR в консоль');
  con_add('clist - вывести список клиентов');
  con_add('БАЗОВЫЕ КОМАНДЫ СЕРВЕРА:');
  con_add('========================');
  exit;
}
if ds_list_find_value(cmd, 0) == 'exit' || ds_list_find_value(cmd, 0) == 'quit'
{
  sys_exit();
  exit;
}
if ds_list_find_value(cmd, 0) == 'die'
{
  sys_exit(1);
  exit;
}
if ds_list_find_value(cmd, 0) == 'echo'
{
  con_echo();
  exit;
}
if ds_list_find_value(cmd, 0) == 'say'
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
    var _s, c;
    _s = '';
    c = string_count(' ', argument0);
    for (i = 1; i < c + 1; i += 1)
    {
        if !is_real(ds_list_find_value(cmd, i)) {_s += string(ds_list_find_value(cmd, i)) + ' ';}
    }
    net_say(_s, 1);
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
  if !instance_exists(o_pl) {con_add ('На сервере нет игроков.'); exit;}
  con_add('========================');
  net_list_clients();
  con_add('СПИСОК ИГРОКОВ (ID, имя, IP):');
  con_add('========================');
  exit;
}
if ds_list_find_value(cmd, 0) == 'bot_add' or ds_list_find_value(cmd, 0) == 'addbot'
{
  if is_real(ds_list_find_value(cmd, 1)) && is_real(ds_list_find_value(cmd, 2)) && is_real(ds_list_find_value(cmd, 3)) && is_real(ds_list_find_value(cmd, 4))
  {
    bot_add(bot_select_name(), bot_select_skin(), make_color_rgb(irandom(255), irandom(255), irandom(255)), plr_select_team());
  }
  else
  {
    var n, c, s, t;
    n = string(ds_list_find_value(cmd, 1));
    s = string(ds_list_find_value(cmd, 2));
    if string(ds_list_find_value(cmd, 3)) == '*' {c = make_color_rgb(irandom(255), irandom(255), irandom(255));} else {c = real(string_digits(ds_list_find_value(cmd, 3))); if string_digits(ds_list_find_value(cmd, 3)) == '' {c = irandom(16777215);}}
    t = real(string_digits(ds_list_find_value(cmd, 4)));
    
    //if n == '*' || (n != '*' && string_letters(n) == '') {n = bot_select_name();}
    //if s == '*' || (s != '*' && string_letters(n) == '') {s = bot_select_skin();}
    if n == '*' || n == '' {n = bot_select_name();}
    if s == '*' || n == '' {s = bot_select_skin();}
    if string(ds_list_find_value(cmd, 4)) == '*' || string(ds_list_find_value(cmd, 4)) == '' || t == 0 {t = plr_select_team();}
    
    bot_add(n, s, c, t);
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
    if ar1 == 'help' {con_add(':: cl_setval(): Следующие параметры могут быть изменены:#hp ap frag inv vis suit ber bpk jet w2 w3 w4 w5 w6 w7 w8 w9 a1 a2 a3 a4.'); exit;}
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
            inst.st_jet = min(1, ar2);
        break;
        case 'inv':
            inst.st_inv = min(1, ar2);
        break;
        case 'vis':
            inst.st_vis = min(1, ar2);
        break;
        case 'suit':
            inst.st_suit = min(1, ar2);
        break;
        case 'ber':
            inst.st_ber = min(1, ar2);
        break;
        case 'bpk':
            inst.st_bpk = min(1, ar2);
        break;
        case 'w2':
            inst.hw[2] = min(1, ar2);
        break;
        case 'w3':
            inst.hw[3] = min(1, ar2);
        break;
        case 'w4':
            inst.hw[4] = min(1, ar2);
        break;
        case 'w5':
            inst.hw[5] = min(1, ar2);
        break;
        case 'w6':
            inst.hw[6] = min(1, ar2);
        break;
        case 'w7':
            inst.hw[7] = min(1, ar2);
        break;
        case 'w8':
            inst.hw[8] = min(1, ar2);
        break;
        case 'w9':
            inst.hw[9] = min(1, ar2);
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
        case 'team':
            if ar2 == 1
            {
                with inst
                {
                    cl_team = 1;
                    cl_color = c_red;
                    plr_send_team();
                    plr_send_skin();
                }
                plr_kill(inst.cl_id);
            
            }
            if ar2 == 2
            {
                with inst
                {
                    cl_team = 2;
                    cl_color = c_blue;
                    plr_send_team();
                    plr_send_skin();
                }
                plr_kill(inst.cl_id);
            }
        break;
        
        default:
            con_add(':: ERROR: Неизвестный параметр.');
    }
    with (inst) {plr_send_stat();}
    exit;
}
if (string_count('sv_', ds_list_find_value(cmd, 0)) > 0 || string_count('bot_', ds_list_find_value(cmd, 0)) > 0 || string_count('cl_', ds_list_find_value(cmd, 0)) > 0 || string_count('mp_', ds_list_find_value(cmd, 0)) > 0) && !(ds_list_find_value(cmd, 0) == 'sv_map' || ds_list_find_value(cmd, 0) = 'sv_password' || ds_list_find_value(cmd, 0) = 'sv_rcon_pwd' || ds_list_find_value(cmd, 0) = 'sv_name' || ds_list_find_value(cmd, 0) = 'sv_priority' || ds_list_find_value(cmd, 0) = 'sv_welcome' || ds_list_find_value(cmd, 0) = 'sv_mastersrv' || ds_list_find_value(cmd, 0) = 'sv_ip' || ds_list_find_value(cmd, 0) = 'cl_setval')
{
  con_cvar_parse(ds_list_find_value(cmd, 0), ds_list_find_value(cmd, 1));
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_map'
{
  var m;
  m = ds_list_find_value(cmd, 1);
  if is_real(m) {con_add(global.sv_map); exit;}
  if m == '>' && global.sv_cycle_maps {m = global.map_list_next;}
  if !file_exists('data\maps\' + m + '.dlv') {con_add(':: ERROR: Карта ' + m + ' не найдена.'); exit;}
  global.sv_map = m;
  global.map_list_next = m;
  if global.map_w == 0 {exit;}
  o_host.alarm[0] = 1;
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
if ds_list_find_value(cmd, 0) == 'sv_mastersrv'
{
  if is_real(ds_list_find_value(cmd, 1)) {con_add(global.sv_mastersrv); exit;}
  global.sv_mastersrv = ds_list_find_value(cmd, 1);
  exit;
}
if ds_list_find_value(cmd, 0) == 'sv_priority'
{
  if is_real(ds_list_find_value(cmd, 1)) || string_letters(ds_list_find_value(cmd, 1)) != '' {con_add(global.sv_priority); exit;}
  global.sv_priority = real(ds_list_find_value(cmd, 1));
  if global.sv_priority < 0 {global.sv_priority = 0;}
  if global.sv_priority > 7 {global.sv_priority = 7;}
  sys_set_priority();
  con_add('sv_priority = ' + string(global.sv_priority));
  exit;
}

if ds_list_find_value(cmd, 0) == 'resync'
{
  o_host.alarm[1] = 1;
  exit;
}

if ds_list_find_value(cmd, 0) == 'repack'
{
  if file_exists('data\temp\' + string(global.sv_map) + '.7z')
  {
    file_delete('data\temp\' + string(global.sv_map) + '.7z');
  }
  map_pack(global.sv_map);
  exit;
}

if ds_list_find_value(cmd, 0) == 'restart'
{
    plr_send_gameover();
    sleep(60);
    with (o_pl) {plr_send_kick(cl_id, "Перезапуск сервера.");}
    sys_exit((string(ds_list_find_value(cmd, 1)) == '1'), true);
    exit;
}

if ds_list_find_value(cmd, 0) == 'cfg_save'
{
  cfg_write(string(ds_list_find_value(cmd, 1)), 1);
  exit;
}

if ds_list_find_value(cmd, 0) == 'cfg_load'
{
  cfg_load(string(ds_list_find_value(cmd, 1)));
  exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)));

