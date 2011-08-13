//inits main host shit

//vars
for(i=0; i < 255; i+=1)
{
    global.sv_plr[i] = noone;
}
for(i=0; i < 24000; i+=1)
{
    global.sv_itm[i] = noone;
}

//init server shit
//determine ip
con_add(':: NET: Пытаемся определить внешний IP...');
global.sv_ip = net_my_ip();
con_add(':: IP: ' + global.sv_ip);
//open tcp socket
sv_tcp = dll39_tcp_listen(25666, 16, 1);
if (sv_tcp)
{
  con_add(":: NET: Открыт TCP-сокет на " + string(global.sv_ip) + ':' + string(global.sv_port));
}
else
{
  dll39_socket_close(sv_tcp);
  con_add(":: NET: FATAL ERROR: Не могу открыть TCP-сокет на  " + string(global.sv_ip) + ':' + string(global.sv_port) + '!');
  game_end();
  exit;
}

//open udp socket
sv_udp = dll39_udp_connect(25667, 1);
if (sv_udp)
{
  con_add(":: NET: Открыт UDP-сокет на " + string(global.sv_ip) + ':' + string(global.sv_port2));
}
else
{
  dll39_socket_close(sv_udp);
  con_add(":: NET: FATAL ERROR: Не могу открыть UDP-сокет на  " + string(global.sv_ip) + ':' + string(global.sv_port2) + '!');
  game_end();
  exit;
}
map_load(global.sv_map);
con_add(':: NET: Сервер включен.');
cfg_load('autoexec.cfg');
alarm[1] = 300; //server list update shit
//that's all, folks

