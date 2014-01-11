//deletes our slist entry
//use on exit
if global.sv_lan {exit;}
var _sl_sock, _sl_host, _sl_hstr, _sl_prt;

_sl_hstr = string_explode(global.sv_mastersrv, ':', false);
_sl_host = string(ds_list_find_value(_sl_hstr, 0));
_sl_prt = real(ds_list_find_value(_sl_hstr, 1));
if _sl_prt == 0 {_sl_prt = 25667;}
ds_list_destroy(_sl_hstr);

_sl_sock = dll39_tcp_connect(_sl_host, _sl_prt, 0);
if (!_sl_sock)
{
  con_add(":: NET: SLIST: WARNING: Не удалось получить доступ к мастерсерверу."); 
  //global.sv_lan = 1; 
} else {
  dll39_buffer_clear(global._sl_buf);
  dll39_write_byte(2, global._sl_buf);
  dll39_write_string("", global._sl_buf);
  dll39_write_string("", global._sl_buf);
  dll39_write_string("", global._sl_buf);
  dll39_write_string("", global._sl_buf);
  dll39_write_double(global.sv_port, global._sl_buf);
  dll39_message_send(_sl_sock,0,0,global._sl_buf);

  dll39_socket_close(_sl_sock);

  con_add(':: NET: SLIST: Сервер удален из списка мастерсервера.');
}
