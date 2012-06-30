//sends the visual player info
dll39_buffer_clear(0);
dll39_write_byte(20, 0);
dll39_write_byte(cl_id, 0);
dll39_write_string(cl_name, 0);
dll39_write_string(cl_skin, 0);
dll39_write_int(cl_color, 0);
with  o_pl
{   
    dll39_message_send(cl_tcp, 0, 0, 0);
}
