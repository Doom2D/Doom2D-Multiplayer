//sends a gameover message that makes players disconnect and go to the inter screen
dyclearbuffer(0);
dywritebyte(19, 0);
dywritebyte(min(global.sv_cycle_maps, 1), 0);
dywritebyte(global.cl_rc_time, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
