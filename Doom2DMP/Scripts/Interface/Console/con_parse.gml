//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
prev_cmd = argument0;
cmd = string_explode(argument0, ' ', false);
if is_real(ds_list_find_value(cmd, 0)){exit;}
if !(ds_list_find_value(cmd, 0) == 'echo' || ds_list_find_value(cmd, 0) == 'say') {con_add('> ' + argument0, true);}
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
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(global.pl_name));
    exit;
  } 
  if room = rm_game
  {
    if !variable_global_exists('cl_inst') {exit;}
    if !instance_exists(global.cl_inst) {exit;}
    net_char_look(string_delete(ds_list_find_value(cmd, 1), 17, string_length(ds_list_find_value(cmd, 1))), global.cl_inst.cl_skin, global.cl_inst.cl_color);
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
        con_add(string(global.r_massacre));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add(string(global.r_massacre));
        exit;
    }
    global.r_massacre = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_massacre > 3 || global.r_massacre < 0 {global.r_massacre = 3;}
    con_add('r_massacre = ' + string(global.r_massacre));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_gfx'
{
    if is_real(ds_list_find_value(cmd, 1))
    {
        con_add(string(global.r_gfx));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add(string(global.r_gfx));
        exit;
    }
    global.r_gfx = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_gfx > 1 || global.r_gfx < 0 {global.r_gfx = 1;}
    if room == rm_game
    {
        if global.r_gfx
        {
            instance_activate_object(o_bkg);
        }
        else
        {
            instance_deactivate_object(o_bkg);
        }
    }
    con_add('r_gfx = ' + string(global.r_gfx));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_names'
{
    if is_real(ds_list_find_value(cmd, 1))
    {
        con_add(string(global.r_names));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add(string(global.r_names));
        exit;
    }
    global.r_names = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_names > 1 || global.r_names < 0 {global.r_names = 1;}
    con_add('r_names = ' + string(global.r_names));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_window'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        if window_get_fullscreen() {con_add('0');} else {con_add('1');}
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        if window_get_fullscreen() {con_add('0');} else {con_add('1');}
        exit;
    }
    if real(string_digits(ds_list_find_value(cmd, 1))) == 0
    {
        window_set_fullscreen(true);
    }
    else
    {
        window_set_fullscreen(false);
    }
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_fskip'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.r_fskip));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.r_fskip));
        exit;
    }
    global.r_fskip = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_fskip > 1 || global.r_fskip < 0 {global.r_fskip = 1;}
    con_add('[THIS WILL TAKE EFFECT ONLY UPON RESTART] r_fskip = ' + string(global.r_fskip));
    exit;
}
if ds_list_find_value(cmd, 0) == 's_preload'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.s_preload));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.s_preload));
        exit;
    }
    global.s_preload = real(string_digits(ds_list_find_value(cmd, 1)));
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
if ds_list_find_value(cmd, 0) == 'cl_slist'
{
  if is_real(ds_list_find_value(cmd, 1))
  {
    con_add(string(global.cl_slist));
    exit;
  } 
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(global.cl_slist));
    exit;
  } 
  global.cl_slist = ds_list_find_value(cmd, 1);
  con_add('cl_slist = ' + string(global.cl_slist));
  exit;
}
if ds_list_find_value(cmd, 0) == 'cl_slist_path'
{
  if is_real(ds_list_find_value(cmd, 1))
  {
    con_add(string(global.cl_slist_path));
    exit;
  } 
  if ds_list_find_value(cmd, 1) == ''
  {
    con_add(string(global.cl_slist_path));
    exit;
  } 
  global.cl_slist_path = ds_list_find_value(cmd, 1);
  con_add('cl_slist_path = ' + string(global.cl_slist_path));
  exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)) + '. Введите help для списка команд.');
