//sends order for client to create some effect
//arg0 - effect id
//arg1 - x
//arg2 - y
dyclearbuffer(0);
dywritebyte(12, 0);
dywritebyte(argument0, 0);
dywriteshort(argument1, 0);
dywriteshort(argument2, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
