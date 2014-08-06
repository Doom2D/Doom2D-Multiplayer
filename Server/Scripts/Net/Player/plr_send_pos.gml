//sends position
dll39_buffer_clear(0);
write_msg_id(7, 0);
dll39_write_byte(cl_id, 0);
dll39_write_byte( build_byte( kb_left, kb_rght, kb_jump, kb_lkup, kb_lkdn, 0, 0, st_talk ), 0 );
dll39_write_short(x, 0);
dll39_write_short(y, 0);
with o_pl { dll39_message_send(cl_tcp, 0, 0, 0); }
