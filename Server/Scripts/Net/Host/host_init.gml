//inits main host shit
//init dll
dllinit(0,true,false);

//vars
for(i=0; i < 16; i+=1)
{
global.player[i] = -1;
}
for(i=0; i < 24000; i+=1)
{
global.item[i] = -1;
}

//init server shit
//open tcp socket
sv_tcp = tcplisten(global.sv_port, 10, 1);
if (sv_tcp)
{
  con_add(":: Открыт TCP-сокет на " + string(global.sv_ip) + ':' + string(global.sv_port));
}
else
{
  closesocket(sv_tcp);
  con_add(":: ERROR: Не могу открыть TCP-сокет на  " + string(global.sv_ip) + ':' + string(global.sv_port) + '!');
  game_end();
  exit;
}

//udp
sv_udp = udpconnect(global.sv_port2, 1);
if (sv_udp)
{
  con_add(":: Открыт UDP-сокет на " + string(global.sv_ip) + ':' + string(global.sv_port2));
}
else
{
  closesocket(sv_tcp);
  closesocket(sv_udp);
  con_add(":: ERROR: Не могу открыть UDP-сокет на " + string(global.sv_ip) + ':' + string(global.sv_port2) + '!');
  game_end();
  exit;
}
con_add(':: Сервер включен.');
//that's all, folks
