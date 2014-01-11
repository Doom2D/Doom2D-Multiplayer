//inits main host shit

//vars
for(i = 0; i < 255; i += 1)
{
    global.sv_plr[i] = noone;
}
for(i = 0; i < 8192; i += 1)
{
    global.sv_itm[i] = noone;
}
global.sv_proj = ds_list_create();
for(i = 0; i < 2048; i += 1)
{
    ds_list_add(global.sv_proj, noone);
}
global.sv_tiles = ds_list_create();

//init server shit
//determine ip
con_add(':: NET: Пытаемся определить внешний IP...');
global.sv_ip = net_my_ip();
con_add(':: IP: ' + global.sv_ip);

//open tcp socket
sv_tcp = dll39_tcp_listen(global.sv_port, MAX_PLAYERS, 1);
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

/*
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
*/

//check ports
if !global.sv_lan && global.sv_portcheck
{
    con_add(':: NET: Пытаемся определить доступность портов...');
    var p1;
    p1 = net_check_port(global.sv_port);
    if !p1
    {
        con_add(':: NET: WARNING: Порт ' + string(global.sv_port) + ' закрыт, либо произошла ошибка при определении.#Ваш сервер не будет доступен извне. sv_lan = 1.');
        global.sv_lan = 1;
    }
    else
    {
        con_add(':: NET: Порт ' + string(global.sv_port) + ' доступен извне.');
    }
}


event_user(0);
con_add(':: NET: Сервер включен.');
alarm[1] = 300; //server list update shit
//that's all, folks

