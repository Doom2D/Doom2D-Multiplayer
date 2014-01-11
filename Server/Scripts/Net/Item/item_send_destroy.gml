//sends item destroy message
//arg0 - item id
dll39_buffer_clear(0);
dll39_write_byte(11, 0);
dll39_write_short(argument0, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}
