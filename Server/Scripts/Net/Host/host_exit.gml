//send exit message
dyclearbuffer(0);
dywritebyte(2, 0);
dywritestring('Сервер выключен.', 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0)};
//close sockets
if variable_local_exists('sv_tcp') {dyclosesock(sv_tcp);}
con_add(':: NET: Закрыт TCP-сокет на ' + string(global.sv_ip) + ':' + string(global.sv_port));

if !global.sv_lan
{
    net_slist_del();
}

//that's all, folks
con_add(':: NET: Сервер выключен.');
