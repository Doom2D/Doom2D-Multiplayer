//send exit message
//
//close sockets
closesocket(sv_tcp);
closesocket(sv_udp);
con_add(':: Закрыт TCP-сокет на ' + string(global.sv_ip) + ':' + string(global.sv_port));
con_add(':: Закрыт UDP-сокет на ' + string(global.sv_ip) + ':' + string(global.sv_port2));

//free 39dll
dllfree();
con_add(':: Сервер выключен.');
