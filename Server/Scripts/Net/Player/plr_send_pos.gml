//sends position
dll39_buffer_clear(0);
dll39_write_byte(7, 0);
dll39_write_byte(cl_id, 0);
dll39_write_byte(kb_left, 0);
dll39_write_byte(kb_rght, 0);
dll39_write_byte(kb_jump, 0);
dll39_write_byte(kb_lkup, 0);
dll39_write_byte(kb_lkdn, 0);
dll39_write_byte(st_talk, 0);
dll39_write_short(x, 0);
dll39_write_short(y, 0);
with  o_pl
{   
    dll39_message_send(cl_tcp, 0, 0, 0);
}
