//sends order for client to create a corpse
//0 - player id
//1 - x
//2 - y
dll39_buffer_clear(0);
write_msg_id(15, 0);
dll39_write_byte(argument0, 0);
dll39_write_short(argument1, 0);
dll39_write_short(argument2, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}
