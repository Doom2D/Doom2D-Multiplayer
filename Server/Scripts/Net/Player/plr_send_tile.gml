//sends a tile state toggle
//a0 - tile id
//a1 - if active (2 means lift toggle)

dyclearbuffer(0);
dywritebyte(26, 0);
dywriteushort(argument0, 0);
dywritebyte(argument1, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
