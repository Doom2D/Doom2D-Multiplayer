//gets your ip from the master
if global.sv_lan {return mplay_ipaddress();}
var sock_id, run, size, mid, prt, str;
str = string_explode(global.sv_mastersrv, ':', false);
host = string(ds_list_find_value(str, 0));
prt = real(string_digits(ds_list_find_value(str, 1)));
if prt == 0 {prt = 25667;}
ds_list_destroy(str);

sock_id = dll39_tcp_connect(host, prt, 0);
if (!sock_id) {
    con_add(":: NET: SLIST: WARNING: Не могу соединиться с мастерсервером. sv_lan -> 1. Используется локальный IP.");
    global.sv_lan = 1;
    return mplay_ipaddress();
    exit;
}

dll39_buffer_clear(global._sl_buf);
dll39_write_byte(3, global._sl_buf); //mode3 - get IP
dll39_write_string("", global._sl_buf);
dll39_write_double(0, global._sl_buf);
dll39_write_string("", global._sl_buf);
dll39_write_string("", global._sl_buf);
dll39_write_string("", global._sl_buf);
dll39_write_double(0, global._sl_buf);
dll39_message_send(sock_id, 0, 0, global._sl_buf);
    
while 1 {
    size = dll39_message_receive(sock_id, 0, global._sl_buf);
    if size < 0 {break;}
    
    mid = dll39_read_byte(global._sl_buf);
    if mid == 253
    {
        dll39_socket_close(sock_id);
        return dll39_read_string(global._sl_buf);
        break;
    }
}

dll39_socket_close(sock_id);
