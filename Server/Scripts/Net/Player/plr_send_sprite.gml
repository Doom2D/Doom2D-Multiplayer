//sends special sprite message
//argument0 - player id
//argument1 - if attack sprite
//argument2 - if pain sprite
dyclearbuffer(0);
dywritebyte(14, 0);
dywritebyte(argument0, 0);
dywritebyte(argument1, 0);
dywritebyte(argument2, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
