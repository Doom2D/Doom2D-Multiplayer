//sends a gameover message that makes players disconnect and go to the inter screen
dll39_buffer_clear(0);
dll39_write_byte(19, 0);
dll39_write_byte(min(global.sv_cycle_maps, 1), 0);
dll39_write_byte(global.cl_rc_time, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}
