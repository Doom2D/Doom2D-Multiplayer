if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}
if global.dem_mode >= 2 {exit;}
dll39_write_byte(10, global.send_buf);
dll39_write_string(argument0, global.send_buf); //name
dll39_write_string(argument1, global.send_buf); //skin
dll39_write_int(argument2, global.send_buf); //color
tcp_send(global.cl_tcp, global.send_buf);
