//send exit message
dll39_buffer_clear(0);
dll39_write_byte(2, 0);
dll39_write_string('Server shutting down.', 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0)};
//close sockets
if variable_local_exists('sv_tcp') {dll39_socket_close(sv_tcp);}
if variable_local_exists('sv_udp') {dll39_socket_close(sv_udp);}
con_add(':: NET: Закрыт TCP-сокет на ' + string(global.sv_ip) + ':' + string(global.sv_port));

//that's all, folks
con_add(':: NET: Сервер выключен.');
