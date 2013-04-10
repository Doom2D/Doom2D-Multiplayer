//deletes our slist entry
//use on exit
if global.sv_lan {exit;}
var _sl_sock, _sl_host, _sl_hstr, _sl_prt;

_sl_hstr = string_explode(global.sv_slist, ':', false);
_sl_host = string(ds_list_find_value(_sl_hstr, 0));
_sl_prt = real(ds_list_find_value(_sl_hstr, 1));
if _sl_prt == 0 {_sl_prt = 25667;}
ds_list_destroy(_sl_hstr);

_sl_sock = dytcpconnect(_sl_host, _sl_prt, 0);
if (!_sl_sock)
{
    con_add(":: NET: SLIST: WARNING: Не удалось получить доступ к мастерсерверу."); 
    //global.sv_lan = 1; 
}
else
{
    //dll39_set_nagle(_sl_sock, 1);
    dyclearbuffer(global._sl_buf);
    dywritebyte(2, global._sl_buf);
    dywritestring("", global._sl_buf);
    dywritestring("", global._sl_buf);
    dywritestring("", global._sl_buf);
    dywritestring("", global._sl_buf);
    dywritedouble(0, global._sl_buf);
    dysendmessage(_sl_sock,0,0,global._sl_buf);

    dyclosesock(_sl_sock);

    con_add(':: NET: SLIST: Сервер удален из списка мастерсервера.');
}
