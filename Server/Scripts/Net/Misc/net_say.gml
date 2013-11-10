//similar to echo but sends to server
//a0 - string to say
//a1 - if include the 'server' prefix

if argument1 {_str = 'СЕРВЕР: ' + argument0;} else {_str = argument0;}

dyclearbuffer(0);
dywritebyte(5, 0);
dywritestring(_str, 0);
with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0)};

con_add(_str);
