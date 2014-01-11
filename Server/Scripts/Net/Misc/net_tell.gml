//similar to say but sends to current client only
//a0 - string to say

_str = argument0;

dll39_buffer_clear(0);
dll39_write_byte(5, 0);
dll39_write_string(_str, 0);
dll39_message_send(cl_tcp, 0, 0, 0);
