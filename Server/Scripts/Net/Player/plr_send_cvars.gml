//sends cvars n shit
dyclearbuffer(0);
dywritebyte(27, 0);
dywritestring(global.sv_name, 0);
dywritebyte(global.sv_maxplayers, 0);
if global.mp_gamemode == 0 {dywritebyte(global.mp_fraglimit, 0);} 
if global.mp_gamemode == 1 {dywritebyte(global.mp_scorelimit, 0);}
if global.mp_gamemode == 2 {dywritebyte(global.mp_caplimit, 0);}
dywritebyte(global.mp_waterfrag, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
