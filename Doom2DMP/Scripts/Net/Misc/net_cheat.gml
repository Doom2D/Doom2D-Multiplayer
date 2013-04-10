//lol cheat
//argument0 - cheat id
//1 - godmode
//2 - flymode
//3 - all weapons
//4 - insta-death
if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}
dyclearbuffer(0);
dywritebyte(9, 0);
dywritebyte(argument0, 0);
dysendmessage(global.cl_tcp, 0, 0, 0);
