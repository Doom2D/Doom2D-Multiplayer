//sends item destroy message
//arg0 - item id
dyclearbuffer(0);
dywritebyte(11, 0);
dywriteshort(argument0, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
