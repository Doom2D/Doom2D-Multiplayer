//transfers file send state
//a0 - client id
dll39_buffer_clear(0);
dll39_write_byte(21, 0);
dll39_write_byte(fsend_state, 0);
dll39_write_int(fsend_size, 0);
dll39_write_string(fsend_path, 0);
dll39_write_string(fsend_md5, 0);
dll39_write_string(fsend_cmd5, 0);
with id_to_cl(argument0)
{
    dll39_message_send(cl_tcp, 0, 0, 0);
}
