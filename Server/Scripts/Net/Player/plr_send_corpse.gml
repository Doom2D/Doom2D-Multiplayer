//sends order for client to create a corpse
//0 - player id
//1 - x
//2 - y
dyclearbuffer(0);
dywritebyte(15, 0);
dywritebyte(argument0, 0);
dywriteshort(argument1, 0);
dywriteshort(argument2, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
