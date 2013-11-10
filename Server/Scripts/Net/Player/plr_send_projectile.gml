//creates a projectile
//arg0 - projectile type (corresponds to image index)
//arg1 - direction
//arg2 - x
//arg3 - y

dyclearbuffer(0);
dywritebyte(16, 0);
dywriteshort(pr_id, 0);
dywritebyte(argument0, 0);
dywriteshort(argument1, 0);
dywriteshort(argument2, 0);
dywriteshort(argument3, 0);
with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0);}
