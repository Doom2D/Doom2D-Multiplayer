//inits all the shit for client-side networking
var prt, ip, istr;
global.sv_map = '';
global.sv_maxplayers = 16;
global.sv_name = 'Doom2DMP Server';
global.cl_ping = 0;
global.cl_ping_delay = 0;
global.cl_last_ping = 0;
global.cl_inst = o_con;
global.map_w = 0;
global.map_h = 0;
global.map_name = '';
global.map_desc = '';
global.team_score[1] = 0;
global.team_score[2] = 0;
global.debug_counter = 0;

for(i = 0; i < 255; i += 1)
{
  global.cl_plr[i] = noone;
}
for(i = 0; i < 8192; i += 1)
{
  global.cl_itm[i] = noone;
}

global.cl_proj = ds_list_create();
for(i = 0; i < 2048; i += 1)
{
  ds_list_add(global.cl_proj, noone);
}

con_parse('cls');

if global.dem_fn != '' {demo_play();}

if global.dem_mode >= 2 {exit;}

//divide the ip string
istr = string_explode(global.sv_ip, ':', false);
if is_real(ds_list_find_value(istr, 0))
{
  con_add(":: NET: Неверный адрес.");
  dll39_socket_close(global.cl_tcp);
  mus_play(global.mus_menu);
  room_goto(rm_menu);
  ds_list_destroy(istr);
  exit;
}
ip = ds_list_find_value(istr, 0);
prt = real(ds_list_find_value(istr, 1));
if prt == 0 {prt = 25666;}
ds_list_destroy(istr);

//try to connect
con_add(":: NET: Пытаемся соединиться с " + string(ip) + ":" + string(prt) + "...");
screen_redraw();
global.cl_tcp = dll39_tcp_connect(ip, prt, true);

if dll39_tcp_connected(global.cl_tcp)
{
  //did connect
  if global.dem_will == 'ДА' {demo_rec();}

  dll39_set_nagle(global.cl_tcp, 1);
  con_add(':: NET: Успешно присоединились к ' + string(ip) + ':' + string(prt));

  //send our shit to host
  dll39_write_string(global.pl_name, global.send_buf);
  dll39_write_string(global.pl_skin, global.send_buf);
  dll39_write_int(global.pl_color, global.send_buf);
  dll39_write_byte(global.pl_team, global.send_buf);
  dll39_write_string(global.sys_ver, global.send_buf);
  dll39_write_string(global.sys_bld, global.send_buf);
  dll39_write_string(global.sv_password, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
  con_add(':: NET: Отослана информация о клиенте.');
} else {
  //did not connect
  con_add(':: NET: ERROR: Не удалось соединиться с ' + string(ip) + ':' + string(prt)); 
  dll39_socket_close(global.cl_tcp);
  mus_play(global.mus_menu);
  room_goto(rm_menu);
}

