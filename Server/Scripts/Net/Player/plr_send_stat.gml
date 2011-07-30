//sends stats
dll39_buffer_clear(0);
dll39_write_byte(9, 0);
dll39_write_byte(cl_id, 0);
dll39_write_byte(hp, 0);
dll39_write_byte(ap, 0);
dll39_write_short(a1, 0);
dll39_write_short(a2, 0);
dll39_write_short(a3, 0);
dll39_write_short(a4, 0);
dll39_write_byte(w, 0);
dll39_write_byte(frag, 0);
with  o_pl
{   
    dll39_message_send(cl_tcp, 0, 0, 0);
}
