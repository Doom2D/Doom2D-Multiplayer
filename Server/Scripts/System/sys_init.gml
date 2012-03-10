//inits all needed shit
//gets the first parm
quiet = 0;
if parameter_count() > 0 
{
    if string_lower(parameter_string(1)) == '-q' {quiet = 1;} //nothing at all
    if string_lower(parameter_string(1)) == '-nogui' {quiet = 2;} //1x1 window
}

//vars
global.sys_ver = '0.6';
global.sys_bld = '124';
global.sv_map = 'dm_superdm';
global.sv_port = 25666;
global.sv_port2 = 25667;
global.sv_ip = mplay_ipaddress();
global.sv_name = 'Doom2DMP Server';
global.sv_welcome = 'Добро пожаловать.';
global.sv_maxplayers = 16;
global.sv_use_pwd = 0;
global.sv_password = 'pwd';
global.sv_lan = 0;
global.sv_portcheck = 1;
global.sv_rcon = 0;
global.sv_rcon_pwd = 'pwd';
global.sv_ipbans = 1;
global.sv_cycle_maps = 1;
global.sv_cheats = 0;
global.sv_slist_time = 60;
global.sv_slist = 'doom2d.org';
global.sv_slist_path = '/serverlist/doom2dmp/';
global.sv_clalert = 1;
global.sv_sync_type = 2;
global.sv_rate = 2;
global.sv_dl_rate = 32;
global.sv_dl_allow = 1;
global.sv_fps_max = 60;
global.sv_fps_correct = 0;
global.cl_rc_time = 7;
global.cl_timeout = 15;
global.mp_fraglimit = 25;
global.mp_timelimit = 1800;
global.mp_respawn = 5;
global.mp_respawn_inv = 0;
global.mp_itemrespawn = 60;
global.mp_drop_clear = 30;
global.mp_items = 1;
global.mp_powerups = 1;
global.mp_knockback = 1;
global.mp_selfdamage = 1;
global.mp_flymode = 0;
global.mp_godmode = 0;
global.mp_gamemode = 0;
global.mp_oldaim = 1;
global.mp_itemdrop = 1;
global.mp_dropall = 1;
global.mp_weaponstay = 0;
global.mp_penalty = 1;
global.bot_names = 1;
global.bot_chatter = 0;
global.bot_randrate = 32;
global.bot_cowardly = 0;
global.bot_dummy = 0;
global.sys_log = 'server';
global.map_w = 0;
global.map_h = 0; //need these two because game maker cant change the w and h of the room on the fly

global.map_list = -1;
global.ban_list = -1;
global.name_list = -1;
global.skin_list = -1;
global.name_taken = -1;
global.chat_list = -1;
global.map_list_ind = -1;
global.map_list_next = global.sv_map;
global.map_md5 = '';

//inits log system
log_init();

//checks for winapi
if !file_exists('Max WinAPI 2.dll')
{
    log_add(global.sys_log, ":: SYSTEM: ERROR: Max WinAPI 2.dll не найден.");
    quiet = 2;
}

//console
con_init();
con_add('=====SERVER START=====');
if quiet = 0
  {con_add(':: WINAPI: Иниициализация успешна.');}
else
  {con_add(':: SYSTEM: WARNING: Включен тихий режим. GUI отключен.');}
con_add(':: SYSTEM: Дата: ' + con_timestamp());
con_add(':: SYSTEM: Версия сервера: ' + global.sys_ver + ' (Сборка ' + global.sys_bld + ').');

//check for resources
sys_file_check();

//load config
cfg_load('server.cfg');

//now for the ban and map lists
list_load('data\cfg\ip_bans.txt', 'ban_list');
list_load('data\cfg\bot_chatter.txt', 'chat_list');
list_load('data\cfg\map_list.txt', 'map_list');
list_load('data\cfg\bot_names.txt', 'name_list');
list_load('data\cfg\bot_skins.txt', 'skin_list');

global.name_taken = ds_list_create(); //taken names list for bots
list_add('name_taken', 'DEFAULT');

map_next();
map_tex_init();

global.fps_last = global.sv_fps_max;
