//gets the list from the master
var sock_id, run, size, mid, prt, str;
str = string_explode(global.cl_slist, ':', false);
host = string(ds_list_find_value(str, 0));
prt = real(string_digits(ds_list_find_value(str, 1)));
if prt == 0 {prt = 25667;}
ds_list_destroy(str);

sock_id = dll39_tcp_connect(host, prt, 0);
if (!sock_id) {
    con_add(":: NET: SLIST: ERROR: Не могу получить серверлист.");
    exit;
}

dll39_buffer_clear(0);
dll39_write_byte(0, 0);
dll39_write_string("", 0);
dll39_write_double(0, 0);
dll39_write_string("", 0);
dll39_write_string("", 0);
dll39_write_string("", 0);
dll39_message_send(sock_id, 0, 0, 0);
    
while 1 {
    size = dll39_message_receive(sock_id, 0, 0);
    //con_add(string(size));
    if size < 0 break;
    
    mid = dll39_read_byte(0);
    //con_add(string(mid));
    if mid == 254
    {
        global.slist[0, 5] = dll39_read_byte(0); //total entry count
        //con_add(string(global.slist[0, 5]));
        for (i = 1; i <= global.slist[0, 5]; i += 1)
        {
            global.slist[i, 0] = dll39_read_string(0);
            //con_add(global.slist[i, 0]);
            global.slist[i, 1] = dll39_read_string(0);
            global.slist[i, 1] = string_delete(global.slist[i, 1], 32, string_length(global.slist[i, 1]));
            //con_add(global.slist[i, 1]);
            global.slist[i, 2] = dll39_read_string(0);
            global.slist[i, 2] = string_delete(global.slist[i, 2], 17, string_length(global.slist[i, 1]));
            //con_add(global.slist[i, 2]);
            global.slist[i, 3] = dll39_read_string(0);
            //con_add(global.slist[i, 3]);
            global.slist[i, 4] = dll39_read_string(0);
            //con_add(global.slist[i, 4]);
            prt = dll39_read_double(0);
            global.slist[i, 0] += ':' + string(prt);
            //con_add(global.slist[i, 0]);
        }
        break;
    }
}
dll39_socket_close(sock_id);
//con_add(global.slist[1, 0]);
