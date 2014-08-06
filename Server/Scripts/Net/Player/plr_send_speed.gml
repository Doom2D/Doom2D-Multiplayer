//use in emergency shit only
dll39_buffer_clear(0);
write_msg_id(17, 0);
dll39_write_byte(cl_id, 0);
dll39_write_byte( round(hsp), 0 );
dll39_write_byte( round(vsp), 0 );
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
