//inits all needed shit
//vars
global.sys_ver = '0.6';
global.sys_bld = '109';
global.sv_map = 'test_lift';
global.sv_port = 25666;
global.sv_port2 = 25667;
global.sv_ip = mplay_ipaddress();
global.sv_name = 'D2DMP 0.6 Server';
global.sv_maxplayers = 10;
global.sv_use_pwd = 0;
global.sv_password = 'pwd';
global.sv_lan = 1;
global.sv_rcon = 1;
global.sv_rcon_pwd = 'pwd';
global.sv_ipbans = 1;
global.sv_cycle_maps = 1;
global.cl_timeout = 45;
global.mp_fraglimit = 96;
global.mp_timelimit = 3600;
global.mp_respawn = 8;
global.mp_itemrespawn = 45;
global.mp_items = 1;
global.mp_powerups = 1;
global.mp_knockback = 1;
global.mp_selfdamage = 1;
global.mp_flymode = 0;
global.mp_godmode = 0;
global.mp_oldaim = 1;
global.mp_itemdrop = 1;
global.bot_names = 1;
global.bot_chatter = 0;
global.bot_tickrate = 2;
global.bot_randrate = 4;
global.bot_cowardly = 1;
global.sys_log = 'server';
global.map_w = 0;
global.map_h = 0; //need these two because shitty game maker cant change the w and h of the room on the fly
_log = file_text_open_write('data\logs\' + global.sys_log + '.log');
file_text_close(_log);

global.map_list = -1;
global.ban_list = -1;
global.name_list = -1;
global.name_taken = -1;
global.chat_list = -1;
global.map_list_ind = -1;
global.map_list_next = global.sv_map;
global.map_md5 = '';

//console
con_init();
con_add('================SERVER START================');
con_add(':: Date: ' + con_timestamp());
//fonts
fnt_load();
//load config
cfg_load('server.cfg');

//now for the ban and map lists
list_load('data\cfg\ip_bans.txt', 'ban_list');
list_load('data\cfg\bot_chatter.txt', 'chat_list');
list_load('data\cfg\map_list.txt', 'map_list');
list_load('data\cfg\bot_names.txt', 'name_list');
global.name_taken = ds_list_create();
list_add('name_taken', 'DEFAULT');
global.map_list_ind = list_get_ind('map_list', global.sv_map);
if global.map_list_ind == -1  {global.map_list_next = global.sv_map; exit;}
if global.map_list_ind + 2 > list_get_len('map_list') {global.map_list_ind = -1;}
global.map_list_next = list_get_val('map_list', global.map_list_ind + 1);

