//inits all needed shit
randomize();

//gets the first parm
quiet = 0;
if parameter_count() > 0 
{
  if string_lower(parameter_string(1)) == '-q' {quiet = 1;} //nothing at all
  if string_lower(parameter_string(1)) == '-nogui' {quiet = 2;} //1x1 window
}

//vars
global.sys_ver = '0.6';
global.sys_bld = '130';
global.sys_ini = '';
global.sys_ini_old = '';
global.sv_map = 'dm_superdm';
global.sv_port = 25666;
global.sv_port2 = 25667;
global.sv_ip = mplay_ipaddress();
global.sv_name = 'Doom2DMP Server';
global.sv_welcome = 'Добро пожаловать.';
global.sv_maxplayers = 16;
global.sv_clalert = 1;
global.sv_use_pwd = 0;
global.sv_password = 'pwd';
global.sv_lan = 0;
global.sv_portcheck = 1;
global.sv_rcon = 0;
global.sv_rcon_pwd = 'pwd';
global.sv_ipbans = 1;
global.sv_cycle_maps = 2;
global.sv_cheats = 0;
global.sv_mastersrv = 'mpms.doom2d.org:25667';
global.sv_slist_upd = 60;
global.sv_sync_type = 2;
global.sv_rate = 2;
global.sv_voting = 1; //toggle voting system
global.sv_voting_time = 30;
global.sv_fps_max = 60;
global.sv_fps_correct = 0;
global.sv_dl_allow = 1;
global.sv_dl_rate = 32;
global.sv_dl_mapcfg = 1;
global.sv_md5check = 1;
global.sv_autosave = 0;
global.sv_log_update = 0;
global.sv_autoexec = 2; //0 - doesn't load autoexec 1 - loads autoexec.cfg 2 - loads MAP_NAME.cfg
global.sv_priority = 0;
global.sv_plugins = 1;
global.cl_rc_time = 7;
global.cl_timeout = 15;
global.mp_gamemode = 0; //0 - DM, 1 - TDM, 2 - CTF
global._mp_nextmode = -1;
global.mp_automode = 1;
global.mp_ffire = 0;
global.mp_fraglimit = 23;
global.mp_scorelimit = 30;
global.mp_caplimit = 7;
global.mp_timelimit = 1800;
global.mp_respawn = 5;
global.mp_respawn_inv = 0;
global.mp_itemrespawn = 60;
global.mp_items = 1;
global.mp_powerups = 1;
global.mp_knockback = 1;
global.mp_selfdamage = 1;
global.mp_aimtype = 0;
global.mp_itemdrop = 2;
global.mp_weaponstay = 0;
global.mp_penalty = 1;
global.mp_autobalance = 1;
global.mp_announcer = 1;
global.mp_drop_clear = 30;
global.mp_shootjthr = 0;
global.mp_telefrag = 0;
global.mp_waterfrag = 2;
global.mp_waterbfgdmg = 250;
global.bot_names = 1;
global.bot_chatter = 0;
global.bot_randrate = 32;
global.bot_userate = 32;
global.bot_cowardly = 0;

global.mp_godmode = 0;
global.mp_flymode = 0;
global.bot_dummy = 0;

global.sys_log = 'server';
global.map_w = 0;
global.map_h = 0; //need these two because game maker cant change the w and h of the room on the fly
global.team_score[1] = 0;
global.red_flag = 0; //flag states 0 - standing 1 - taken 2 - dropped
global.blu_flag = 0;

//flag positions
global.red_crd[0] = 0;
global.red_crd[1] = 0;
global.blu_crd[0] = 0;
global.blu_crd[1] = 0;

global.map_list = -1;
global.ban_list = -1;
global.name_list = -1;
global.skin_list = -1;
global.name_taken = -1;
global.chat_list = -1;
global.vote_list = -1;
global.plug_list = -1;
global.plug_num = 0;
global.map_list_ind = -1;
global.map_list_next = global.sv_map;
global.map_md5 = '';
global.vote_now = false;
global.vote_num = 0;
global.vote_str = '';
global.vote_old = '';

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
if quiet = 0 {con_add(':: WINAPI: Инициализация успешна.');}
else         {con_add(':: SYSTEM: WARNING: Включен тихий режим. GUI отключен.');}
con_add(':: SYSTEM: Дата: ' + con_timestamp());
con_add(':: SYSTEM: Версия сервера: ' + global.sys_ver + ' (Сборка ' + global.sys_bld + ').');

//check for resources
sys_file_check();

//load config
cfg_load('server.cfg');

//now for the ban and map lists
list_load('data\cfg\map_list.txt', 'map_list');
list_load('data\cfg\ip_bans.txt', 'ban_list');
list_load('data\cfg\blacklist.txt', 'vote_list');
list_load('data\cfg\plugins.txt', 'plug_list');
list_load('data\cfg\bot_names.txt', 'name_list');
list_load('data\cfg\bot_skins.txt', 'skin_list');
list_load('data\cfg\bot_chatter.txt', 'chat_list');

global.map_played = ds_list_create();
global.name_taken = ds_list_create(); //taken names list for bots

map_tex_init();
map_next();

//additional buffer for serverlist and other shit
global._sl_buf = dll39_buffer_create();

