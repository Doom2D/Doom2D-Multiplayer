//gets the list from the master
var sock_id, run, size, mid, prt, str;
str = string_explode(global.cl_mastersrv, ':', false);
host = string(ds_list_find_value(str, 0));
prt = real(string_digits(ds_list_find_value(str, 1)));
if prt == 0 {prt = 25667;}
ds_list_destroy(str);

sock_id = dytcpconnect(host, prt, false);
if (!sock_id) {
    con_add(":: NET: SLIST: ERROR: Не могу получить серверлист.");
    exit;
}

dyclearbuffer(0);
dywritebyte(0, 0);
dywritestring("", 0);
dywritedouble(0, 0);
dywritestring("", 0);
dywritestring("", 0);
dywritestring("", 0);
dysendmessage(sock_id, 0, 0, 0);
    
while 1 {
    size = dyreceivemessage(sock_id, 0, 0);
    //con_add(string(size));
    if size < 0 break;
    
    mid = dyreadbyte(0);
    //con_add(string(mid));
    if mid == 254
    {
        global.slist[0, 5] = dyreadbyte(0); //total entry count
        //con_add(string(global.slist[0, 5]));
        for (i = 1; i <= global.slist[0, 5]; i += 1)
        {
            global.slist[i, 0] = dyreadstring(0);
            //con_add(global.slist[i, 0]);
            global.slist[i, 1] = dyreadstring(0);
            global.slist[i, 1] = string_delete(global.slist[i, 1], 32, string_length(global.slist[i, 1]));
            //con_add(global.slist[i, 1]);
            global.slist[i, 2] = dyreadstring(0);
            global.slist[i, 2] = string_delete(global.slist[i, 2], 17, string_length(global.slist[i, 1]));
            //con_add(global.slist[i, 2]);
            global.slist[i, 3] = dyreadstring(0);
            //con_add(global.slist[i, 3]);
            global.slist[i, 4] = dyreadstring(0);
            //con_add(global.slist[i, 4]);
            prt = dyreaddouble(0);
            global.slist[i, 0] += ':' + string(prt);
            //con_add(global.slist[i, 0]);
        }
        break;
    }
}
dyclosesock(sock_id);
//con_add(global.slist[1, 0]);
