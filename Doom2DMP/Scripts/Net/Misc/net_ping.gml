//sends a ping message to server, server sends pong message
if global.dem_mode >= 2 {exit;}
dyclearbuffer(0);
dywritebyte(4, 0);
dysendmessage(global.cl_tcp, 0, 0, 0);
_timer = 0;
//con_add("Sent ping to server.");
