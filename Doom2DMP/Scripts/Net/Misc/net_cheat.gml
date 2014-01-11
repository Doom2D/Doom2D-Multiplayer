//lol cheat
//argument0 - cheat id
//1 - godmode
//2 - flymode
//3 - all weapons
//4 - insta-death
if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}
dll39_write_byte(9, global.send_buf);
dll39_write_byte(argument0, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);
