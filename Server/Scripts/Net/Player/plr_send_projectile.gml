//creates a projectile
//arg0 - launcher id
//arg1 - projectile type (coresponds to image index)
//arg2 - direction
//arg3 - x
//arg4 - y
dyclearbuffer(0);
dywritebyte(16, 0);
dywritebyte(argument0, 0);
dywritebyte(argument1, 0);
dywriteshort(argument2, 0);
dywriteshort(argument3, 0);
dywriteshort(argument4, 0);
with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0);}
