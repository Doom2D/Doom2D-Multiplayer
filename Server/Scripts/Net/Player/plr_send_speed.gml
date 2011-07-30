//use in emergency shit only
dll39_buffer_clear(0);
dll39_write_byte(17, 0);
dll39_write_byte(cl_id, 0);
dll39_write_short(hsp, 0);
dll39_write_short(vsp, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
