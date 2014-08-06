//destroys a projectile

dll39_buffer_clear(0);
write_msg_id(28, 0);
dll39_write_short(pr_id, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
