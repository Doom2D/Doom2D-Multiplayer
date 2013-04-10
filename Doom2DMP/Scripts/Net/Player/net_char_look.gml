if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}
if global.dem_mode >= 2 {exit;}
dyclearbuffer(0);
dywritebyte(10, 0);
dywritestring(argument0, 0); //name
dywritestring(argument1, 0); //skin
dywriteint(argument2, 0); //color
dysendmessage(global.cl_tcp, 0, 0, 0);
