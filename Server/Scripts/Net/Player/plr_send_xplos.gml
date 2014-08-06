//sends an explosion message
//arg0 - explosion launcher id
//arg1 - explosion type
//arg2 - x
//arg3 - y

dll39_buffer_clear(0);
write_msg_id(18, 0);
dll39_write_byte(argument0, 0);
dll39_write_byte(argument1, 0);
dll39_write_short(argument2, 0);
dll39_write_short(argument3, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
