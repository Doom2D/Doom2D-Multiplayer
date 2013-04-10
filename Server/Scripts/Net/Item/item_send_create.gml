//sends item create message
//arg0 - item id
//arg1 - item type
//arg2 - item x
//arg3 - item y
//arg4 - respawn anim flag (true/false)
dyclearbuffer(0);
dywritebyte(10, 0);
dywriteshort(argument0, 0);
dywritebyte(argument1, 0);
dywriteshort(argument2, 0);
dywriteshort(argument3, 0);
dywritebyte(argument4, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
