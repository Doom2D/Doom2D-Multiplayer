//transfers file send state
//a0 - process state

dll39_buffer_clear(0);
write_msg_id(21, 0);
dll39_write_byte(argument0, 0);

if argument0
{
  dll39_write_string(fsend_file, 0);
  dll39_write_uint(fsend_size, 0);
  dll39_write_string(fsend_md5, 0);
  dll39_write_string(fsend_cmd5, 0);
}

dll39_message_send(cl_tcp, 0, 0, 0);
