//deletes our slist entry
//use on exit
if global.sv_lan {exit;}
var _sl_sock, _sl_str, _sl_host;
_sl_host = global.sv_slist;
_sl_str = chr(13) + chr(10);

_sl_sock = dll39_tcp_connect(_sl_host, 80, 0);

if (!_sl_sock) {
    con_add(":: NET: SLIST: WARNING: Не удалось получить доступ к серверлисту. sv_lan -> 1.");
    global.sv_lan = 1;
}
else
{

    dll39_set_format(_sl_sock, dll39_format_text, _sl_str);

    dll39_buffer_clear(0);
    dll39_write_chars("GET /slist/delete.php HTTP/1.1" + _sl_str,0);
    dll39_write_chars("Host: " + _sl_host + _sl_str,0);
    dll39_message_send(_sl_sock,0,0,0);

    dll39_socket_close(_sl_sock);

    con_add(":: NET: SLIST: Запись о сервере удалена из серверлиста.");
}
