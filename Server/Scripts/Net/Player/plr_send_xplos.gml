//sends an explosion message
//arg0 - explosion launcher id
//arg1 - explosion type
//arg2 - x
//arg3 - y

dyclearbuffer(0);
dywritebyte(18, 0);
dywritebyte(argument0, 0);
dywritebyte(argument1, 0);
dywriteshort(argument2, 0);
dywriteshort(argument3, 0);
with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0);}
