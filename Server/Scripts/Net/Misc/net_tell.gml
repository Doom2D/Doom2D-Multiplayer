//similar to say but sends to current client only
//a0 - string to say

dll39_buffer_clear(0);
write_msg_id(5, 0);
dll39_write_string(argument0, 0);
dll39_message_send(cl_tcp, 0, 0, 0);
