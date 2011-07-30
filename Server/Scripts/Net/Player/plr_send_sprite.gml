//sends special sprite message
//argument0 - player id
//argument1 - if attack sprite
//argument2 - if pain sprite
dll39_buffer_clear(0);
dll39_write_byte(14, 0);
dll39_write_byte(argument0, 0);
dll39_write_byte(argument1, 0);
dll39_write_byte(argument2, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}
