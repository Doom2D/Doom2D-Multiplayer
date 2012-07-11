//parses entered command
//argument0 = command string
if string(argument0) == '' {exit;}
if string_copy(string(argument0), 1, 1) == ';' {exit;}
prev_cmd = argument0;
cmd = string_explode(argument0, ' ', false);
if is_real(ds_list_find_value(cmd, 0)){exit;}
ds_list_replace(cmd, 0, string_lower(ds_list_find_value(cmd, 0)));
if !(ds_list_find_value(cmd, 0) == 'echo' || ds_list_find_value(cmd, 0) == 'say') {con_add('> ' + argument0, true);}
if ds_list_find_value(cmd, 0) == 'help'
{
  con_add('==Базовые команды===');
  con_add('help - выводит этот список');
  con_add('cfg_exec CONF - загружает конфигурацию из файла data\cfg\CONF.cfg');
  con_add('cfg_save CONF - сохраняет настройки в файл data\cfg\CONF.cfg');
  con_add('echo STR - пишет в консоль строку STR');
  con_add('exit/quit - выход из игры');
  con_add('cfg_load CFG - загрузить конфигурационный файл CFG');
  con_add('cfg_save CFG - сохранить конфигурационный файл CFG');
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
if ds_list_find_value(cmd, 0) == 'cfg_load'
{
  cfg_load(string(ds_list_find_value(cmd, 1)));
  exit;
}
if ds_list_find_value(cmd, 0) == 'cfg_save'
{
  cfg_write(string(ds_list_find_value(cmd, 1)));
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
    if global.r_massacre < 0 || global.r_massacre > 3 {global.r_massacre = 3;}
    con_add('r_massacre = ' + string(global.r_massacre));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_flash'
{
    if is_real(ds_list_find_value(cmd, 1))
    {
        con_add(string(global.r_flash));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add(string(global.r_flash));
        exit;
    }
    global.r_flash = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_flash < 0 || global.r_flash > 1 {global.r_flash = 1;}
    con_add('r_flash = ' + string(global.r_flash));
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
    if global.r_gfx < 0 || global.r_gfx > 1 {global.r_gfx = 1;}
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
    if global.r_names < 0 || global.r_names > 1 {global.r_names = 1;}
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
    if global.r_fskip < 0 || global.r_fskip > 1 {global.r_fskip = 1;}
    con_add('[ИЗМЕНЕНИЯ ВСТУПЯТ В СИЛУ ПОСЛЕ ПЕРЕЗАГРУЗКИ] r_fskip = ' + string(global.r_fskip));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_scale'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.r_scale));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.r_scale));
        exit;
    }
    global.r_scale = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_scale < 0 || global.r_scale > 1 {global.r_scale = 1;}
    con_add('r_scale = ' + string(global.r_scale));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_width'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.r_width));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.r_width));
        exit;
    }
    global.r_width = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_width < 640 || global.r_width > 2048 {global.r_width = 1024;}
    con_add('r_width = ' + string(global.r_width));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_height'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.r_height));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.r_height));
        exit;
    }
    global.r_height = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_height < 480 || global.r_height > 2048 {global.r_height = 768;}
    con_add('r_height = ' + string(global.r_height));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_fps_correct'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.r_fps_correct));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.r_fps_correct));
        exit;
    }
    global.r_fps_correct = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_fps_correct < 0 || global.r_fps_correct > 1 {global.r_fps_correct = 1;}
    con_add('[ИЗМЕНЕНИЯ ВСТУПЯТ В СИЛУ ПОСЛЕ ПЕРЕЗАГРУЗКИ] r_fps_correct = ' + string(global.r_fps_correct));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_vsync'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.r_vsync));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.r_vsync));
        exit;
    }
    global.r_vsync = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_vsync < 0 || global.r_vsync > 1 {global.r_vsync = 1;}
    set_synchronization(global.r_vsync);
    con_add('r_vsync = ' + string(global.r_vsync));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_announcer'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.r_announcer));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.r_announcer));
        exit;
    }
    global.r_announcer = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.r_announcer < 0 || global.r_announcer > 1 {global.r_announcer = 1;}
    con_add('r_announcer = ' + string(global.r_announcer));
    exit;
}
if ds_list_find_value(cmd, 0) == 'r_restart'
{
    r_setres(global.r_width, global.r_height);
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
    if global.s_preload < 0 || global.s_preload > 1 {global.s_preload = 1;}
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
if ds_list_find_value(cmd, 0) == 'cl_rate'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.cl_rate));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.cl_rate));
        exit;
    }
    global.cl_rate = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.cl_rate < 1 || global.cl_rate > 64 {global.cl_rate = 1;}
    con_add('cl_rate = ' + string(global.cl_rate));
    exit;
}
if ds_list_find_value(cmd, 0) == 'cl_sync_type'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.cl_sync_type));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.cl_sync_type));
        exit;
    }
    global.cl_sync_type = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.cl_sync_type < 0 || global.cl_sync_type > 1 {global.cl_sync_type = 1;}
    con_add('cl_sync_type = ' + string(global.cl_sync_type));
    exit;
}
if ds_list_find_value(cmd, 0) == 'cl_dl_allow'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.cl_dl_allow));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.cl_dl_allow));
        exit;
    }
    global.cl_dl_allow = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.cl_dl_allow < 0 || global.cl_dl_allow > 1 {global.cl_dl_allow = 1;}
    con_add('cl_dl_allow = ' + string(global.cl_dl_allow));
    exit;
}
if ds_list_find_value(cmd, 0) == 'cl_dl_override'
{
    if is_real(ds_list_find_value(cmd, 1)) 
    {
        con_add(string(global.cl_dl_override));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(string(ds_list_find_value(cmd, 1))) != ''
    {
        con_add(string(global.cl_dl_override));
        exit;
    }
    global.cl_dl_override = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.cl_dl_override < 0 || global.cl_dl_override > 1 {global.cl_dl_override = 1;}
    con_add('cl_dl_override = ' + string(global.cl_dl_override));
    exit;
}
if ds_list_find_value(cmd, 0) == 'changeteam'
{
    team_change();
    exit;
}
if ds_list_find_value(cmd, 0) == 'team'
{
    if is_real(ds_list_find_value(cmd, 1))
    {
        con_add(string(global.pl_team));
        exit;
    }
    if ds_list_find_value(cmd, 1) == '' || string_letters(ds_list_find_value(cmd, 1)) != ''
    {
        con_add(string(global.pl_team));
        exit;
    }
    global.pl_team = real(string_digits(ds_list_find_value(cmd, 1)));
    if global.pl_team < 1 || global.pl_team > 2 {global.pl_team = 1;}
    con_add('team = ' + string(global.pl_team));
    exit;
}
con_add('Неизвестная команда: ' + string(ds_list_find_value(cmd, 0)) + '. Введите help для списка команд.');
