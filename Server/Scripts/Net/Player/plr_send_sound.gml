//sound arg0 will play on all clients at (arg1, arg2)
var s_i, s_x, s_y;
s_i = argument0;
s_x = argument1;
s_y = argument2;

dyclearbuffer(0);
dywritebyte(13, 0);
dywritebyte(s_i, 0);
dywriteshort(s_x, 0);
dywriteshort(s_y, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}

