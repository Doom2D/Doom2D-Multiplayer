//sound arg0 will be played on all clients at (arg1, arg2)
var s_i, s_x, s_y;
s_i = argument0;
s_x = argument1;
s_y = argument2;

dll39_buffer_clear(0);
dll39_write_byte(13, 0);
dll39_write_byte(s_i, 0);
dll39_write_short(s_x, 0);
dll39_write_short(s_y, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}

