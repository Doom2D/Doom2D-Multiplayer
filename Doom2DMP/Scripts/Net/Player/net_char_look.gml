if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}
dll39_buffer_clear(0);
dll39_write_byte(10, 0);
dll39_write_byte(global.pl_id, 0);
dll39_write_string(argument0, 0); //name
dll39_write_string(argument1, 0); //skin
dll39_write_int(argument2, 0); //color
dll39_message_send(global.cl_tcp, 0, 0, 0);
