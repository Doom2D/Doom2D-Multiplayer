//Description: Gets the list of available games from the server
//Arguments: none
var sock_id,new_line,listening,headers,game;
host = global.cl_slist;
ds_list_clear(global.slist);

sock_id = dll39_tcp_connect(host,80,0);
if (!sock_id) {
    con_add(":: NET: SLIST: ERROR: Не могу получить серверлист.");
    exit;
}

dll39_set_format(sock_id, dll39_format_text,chr(13) + chr(10));

new_line = chr(13) + chr(10);

dll39_buffer_clear(0);
//Edit the following line to reflect where your php file is on your server
dll39_write_chars("GET " + global.cl_slist_path + "list.php?ingame=1 HTTP/1.0" + new_line, 0);
dll39_write_chars("Host: " + host + new_line, 0);
dll39_message_send(sock_id, 0, 0, 0);
    
listening = true;

while(listening) {
    dll39_message_receive(sock_id, 0, 0);
    headers = dll39_read_sep(" ", 0);
    if(headers == "") {
        listening = false;
        break;
    }
}

dll39_set_format(sock_id, dll39_format_none, '');

result = "";

size = dll39_message_receive(sock_id, 10000, 0);

while(true) {
    game = dll39_read_sep(chr(10),0);
    if(game == "") {break;}
    ds_list_add(global.slist, string_replace_all(game,"|", " | "));
}

dll39_socket_close(sock_id);
