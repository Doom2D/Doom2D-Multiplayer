//sends a tile state toggle
//a0 - tile id
//a1 - if active (2 means lift toggle)

dll39_buffer_clear(0);
write_msg_id(26, 0);
dll39_write_ushort(argument0, 0);
dll39_write_byte(argument1, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}
