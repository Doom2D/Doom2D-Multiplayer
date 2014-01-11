//sends a ping message to server, server sends pong message
if global.dem_mode >= 2 {exit;}
dll39_write_byte(4, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);
_timer = 0;

