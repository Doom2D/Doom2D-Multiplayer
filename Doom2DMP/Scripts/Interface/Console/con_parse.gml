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
  con_add('cfg_exec CONF - загружает конфигурацию из файла data\cfg\CONF.cfg');
  con_add('cfg_save CONF - сохраняет настройки в файл data\cfg\CONF.cfg');
  con_add('echo STR - пишет в консоль строку STR');
  con_add('exit/quit - выход из игры');
  con_add('disconnect - отсоединиться от сервера');
  con_add('======================');
  exit;
}
if ds_list_find_value(cmd, 0) == 'exit' or ds_list_find_value(cmd, 0) == 'quit'
{
  cl_disconnect();
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
  if ds_list_find_value(cmd, 1) == '' || room == rm_game
  {
    con_add(string(global.pl_name));
    exit;
  } 
  global.pl_name = string_delete(ds_list_find_value(cmd, 1), 17, string_length(ds_list_find_value(cmd, 1)));
  exit;
}
if ds_list_find_value(cmd, 0) == 's_vol_sound'
{
  if is_real(ds_list_find_value(cmd, 1)) || string_letters(ds_list_find_value(cmd, 1)) != ''
  {
    con_add(string(FMODGroupGetVolume(2)*100));
    exit;
  } 
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(FMODGroupGetVolume(2)*100));
    exit;
  } 
  FMODGroupSetVolume(2, real(ds_list_find_value(cmd, 1))/100);
  exit;
}
if ds_list_find_value(cmd, 0) == 's_vol_music'
{
  if is_real(ds_list_find_value(cmd, 1)) || string_letters(ds_list_find_value(cmd, 1)) != ''
  {
    con_add(string(FMODGroupGetVolume(3)*100));
    exit;
  } 
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(FMODGroupGetVolume(3)*100));
    exit;
  } 
  FMODGroupSetVolume(3, real(ds_list_find_value(cmd, 1))/100);
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
if ds_list_find_value(cmd, 0) == 'cfg_exec'
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
  con_echo();
  exit;
}
if ds_list_find_value(cmd, 0) == 'say'
{
  if room == rm_game {net_say();} else {con_add("Вы сейчас не в игре.");}
  exit;
}
if ds_list_find_value(cmd, 0) == 'bind'
{
  key_bind(ds_list_find_value(cmd, 1), ds_list_find_value(cmd, 2));
  exit;
}
if ds_list_find_value(cmd, 0) == 'disconnect'
{
  cl_disconnect();
  mus_play(global.mus_menu);
  room_goto(rm_menu);
  exit;
}
if ds_list_find_value(cmd, 0) == 'bind_info'
{
  bind_info();
  exit;
}
if ds_list_find_value(cmd, 0) == 'r_massacre'
{
    if is_real(ds_list_find_value(cmd, 1))
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    global.r_massacre = real(ds_list_find_value(cmd, 1));
    if global.r_massacre > 3 || global.r_massacre < 0 {global.r_massacre = 3;}
    con_add('r_massacre = ' + string(global.r_massacre));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_gfx'
{
    if is_real(ds_list_find_value(cmd, 1))
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    global.r_gfx = real(ds_list_find_value(cmd, 1));
    if global.r_gfx > 1 || global.r_gfx < 0 {global.r_gfx = 1;}
    con_add('r_gfx = ' + string(global.r_gfx));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_names'
{
    if is_real(ds_list_find_value(cmd, 1))
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    global.r_names = real(ds_list_find_value(cmd, 1));
    if global.r_names > 1 || global.r_names < 0 {global.r_names = 1;}
    con_add('r_names = ' + string(global.r_names));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_window'
{
    if is_real(ds_list_find_value(cmd, 1)) || ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    if real(ds_list_find_value(cmd, 1)) == 0
    {
        window_set_fullscreen(true);
    }
    else
    {
        window_set_fullscreen(false);
    }
    exit;
}
if ds_list_find_value(cmd, 0) == 's_preload'
{
    if is_real(ds_list_find_value(cmd, 1)) || ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add('Недопустимое значение аргумента.');
        exit;
    }
    global.s_preload = real(ds_list_find_value(cmd, 1));
    if global.s_preload > 1 || global.s_preload < 0 {global.s_preload = 1;}
    con_add('s_preload = ' + string(global.s_preload));
    exit;
}
if ds_list_find_value(cmd, 0) == 'sv_password'
{
  if is_real(ds_list_find_value(cmd, 1))
  {
    con_add(string(global.sv_password));
    exit;
  } 
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(global.sv_password));
    exit;
  } 
  global.sv_password = string_delete(ds_list_find_value(cmd, 1), 9, string_length(ds_list_find_value(cmd, 1)));
  con_add('sv_password = ' + string(global.sv_password));
  exit;
}    
if ds_list_find_value(cmd, 0) == 'sv_rcon_pwd'
{
  if is_real(ds_list_find_value(cmd, 1))
  {
    con_add(string(global.sv_rcon_pwd));
    exit;
  } 
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(global.sv_rcon_pwd));
    exit;
  } 
  global.sv_rcon_pwd = string_delete(ds_list_find_value(cmd, 1), 9, string_length(ds_list_find_value(cmd, 1)))
  con_add('sv_rcon_pwd = ' + string(global.sv_rcon_pwd));
  exit;
} 
if ds_list_find_value(cmd, 0) == 'cls'
{
    o_con.con_str = '';
    o_con.msg_str = '';
    exit;
}
if ds_list_find_value(cmd, 0) == 'rcon'
{
    net_rcon();
    exit;
}
if ds_list_find_value(cmd, 0) == 'ГОРЕЦ'
{
    net_cheat(1);
    exit;
}
if ds_list_find_value(cmd, 0) == 'БЕЛЫЙОРЕЛ'
{
    net_cheat(2);
    exit;
}
if ds_list_find_value(cmd, 0) == 'RAMBO'
{
    net_cheat(3);
    exit;
}
if ds_list_find_value(cmd, 0) == 'IDDQD' || ds_list_find_value(cmd, 0) == 'kill'
{
    net_cheat(4);
    exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)) + '. Введите help для списка команд.');
