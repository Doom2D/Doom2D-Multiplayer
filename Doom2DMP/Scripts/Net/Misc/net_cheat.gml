//lol cheat
//argument0 - cheat id
//1 - godmode
//2 - flymode
//3 - all weapons
//4 - insta-death
if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}
dll39_buffer_clear(0);
dll39_write_byte(9, 0);
dll39_write_byte(global.pl_id, 0);
dll39_write_byte(argument0, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);
