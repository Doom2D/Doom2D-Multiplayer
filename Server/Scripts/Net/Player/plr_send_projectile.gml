//creates a projectile
//arg0 - projectile type (corresponds to image index)
//arg1 - direction
//arg2 - x
//arg3 - y

dll39_buffer_clear(0);
dll39_write_byte(16, 0);
dll39_write_short(pr_id, 0);
dll39_write_byte(argument0, 0);
dll39_write_short(argument1, 0);
dll39_write_short(argument2, 0);
dll39_write_short(argument3, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
