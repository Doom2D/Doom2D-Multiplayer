//sends the player's team

dll39_buffer_clear(0);
write_msg_id(24, 0);
dll39_write_byte(cl_id, 0); //id
dll39_write_byte(cl_team, 0); //team

with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
