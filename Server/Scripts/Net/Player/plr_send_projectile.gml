//creates a projectile
//arg0 - launcher id
//arg1 - projectile type (coresponds to image index)
//arg2 - direction
//arg3 - x
//arg4 - y
dll39_buffer_clear(0);
dll39_write_byte(16, 0);
dll39_write_byte(argument0, 0);
dll39_write_byte(argument1, 0);
dll39_write_short(argument2, 0);
dll39_write_short(argument3, 0);
dll39_write_short(argument4, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
