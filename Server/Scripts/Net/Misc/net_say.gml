//similar to echo but sends to server
//a0 - string to say
//a1 - if include the 'server' prefix

var str;
if argument1 {str = 'СЕРВЕР: ' + argument0;} else {str = argument0;}

dll39_buffer_clear(0);
write_msg_id(5, 0);
dll39_write_string(str, 0);
with o_pl { dll39_message_send(cl_tcp, 0, 0, 0) };

con_add(str);
