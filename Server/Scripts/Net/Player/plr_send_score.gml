//sends team score
dll39_buffer_clear(0);
write_msg_id(25, 0);
dll39_write_byte(global.team_score[1], 0); //red
dll39_write_byte(global.team_score[2], 0); //blu

with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
