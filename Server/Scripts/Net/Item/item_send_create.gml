//sends item create message
//arg0 - item id
//arg1 - item type
//arg2 - item x
//arg3 - item y
//arg4 - respawn anim flag (true/false)
dll39_buffer_clear(0);
write_msg_id(10, 0);
dll39_write_short(argument0, 0);
dll39_write_byte(argument1, 0);
dll39_write_short(argument2, 0);
dll39_write_short(argument3, 0);
dll39_write_byte(argument4, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}
