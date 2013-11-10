//gets your ip from the master
if global.sv_lan {return mplay_ipaddress();}
var sock_id, run, size, mid, prt, str;
str = string_explode(global.sv_mastersrv, ':', false);
host = string(ds_list_find_value(str, 0));
prt = real(string_digits(ds_list_find_value(str, 1)));
if prt == 0 {prt = 25667;}
ds_list_destroy(str);

sock_id = dytcpconnect(host, prt, 0);
if (!sock_id) {
    con_add(":: NET: SLIST: WARNING: Не могу соединиться с мастерсервером. sv_lan -> 1. Используется локальный IP.");
    global.sv_lan = 1;
    return mplay_ipaddress();
    exit;
}

dyclearbuffer(global._sl_buf);
dywritebyte(3, global._sl_buf); //mode3 - get IP
dywritestring("", global._sl_buf);
dywritedouble(0, global._sl_buf);
dywritestring("", global._sl_buf);
dywritestring("", global._sl_buf);
dywritestring("", global._sl_buf);
dywritedouble(0, global._sl_buf);
dysendmessage(sock_id, 0, 0, global._sl_buf);
    
while 1 {
    size = dyreceivemessage(sock_id, 0, global._sl_buf);
    if size < 0 {break;}
    
    mid = dyreadbyte(global._sl_buf);
    if mid == 253
    {
        dyclosesock(sock_id);
        return dyreadstring(global._sl_buf);
        break;
    }
}

dyclosesock(sock_id);
