//inits all needed shit
//vars
global.sys_ver = '0.6';
global.sys_bld = '105';
global.sv_map = 'dm_superdm';
global.sv_port = 10666;
global.sv_port2 = 10667;
global.sv_ip = mplay_ipaddress();
global.sv_name = 'D2DMP 0.6 Server';
global.sv_maxplayers = 8;
global.sys_log = 'server_' + string(current_day) + string(current_month) + string(current_year) + '_' + string(current_hour) + string(current_minute);
//console
con_init();
con_add('================SERVER START================');
con_add(':: Date: ' + string(current_day) + '.' + string(current_month) + '.' + string(current_year) + ', ' + string(current_hour) + ':' + string(current_minute));
//fonts
fnt_load();
//load config
//cfg_load('server.cfg');
