//sends a gameover message that makes players disconnect and go to the inter screen
dll39_buffer_clear(0);
dll39_write_byte(19, 0);
dll39_write_byte(global.sv_cycle_maps, 0);
with  o_pl
{   
    dll39_message_send(cl_tcp, 0, 0, 0);
}
