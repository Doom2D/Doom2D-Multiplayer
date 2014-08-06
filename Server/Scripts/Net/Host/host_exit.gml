//send exit message

for (i = 0; i < list_get_len('plug_list'); i += 1)
    plug_unload(list_get_val('plug_list', i));
        

dll39_buffer_clear(0);
write_msg_id(2, 0);
dll39_write_string('Сервер выключен.', 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0)};
//close sockets
if variable_local_exists('sv_tcp') {dll39_socket_close(sv_tcp);}
con_add(':: NET: Закрыт TCP-сокет на ' + string(global.sv_ip) + ':' + string(global.sv_port));

if !global.sv_lan {net_slist_del();}

//that's all, folks
con_add(':: NET: Сервер выключен.');
