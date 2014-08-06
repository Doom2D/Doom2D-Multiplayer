//use if you want server to abort the transfer
//arg0 - should be map loaded and player respawned on server

if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}

dll39_write_byte(11, global.send_buf);
dll39_write_byte(argument0, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);

net_fget_clear();
if argument0 {event_user(0);}
