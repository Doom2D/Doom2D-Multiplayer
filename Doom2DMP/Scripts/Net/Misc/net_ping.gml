//sends a ping message to server, server sends pong message
dll39_buffer_clear(0);
dll39_write_byte(4, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);
_timer = 0;
//con_add("Sent ping to server.");
