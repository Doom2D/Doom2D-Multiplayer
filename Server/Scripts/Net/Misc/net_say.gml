//similar to echo but sends to server
//a0 - string to say
//a1 - if include the 'server' prefix

if argument1 {_str = 'СЕРВЕР: ' + argument0;} else {_str = argument0;}

dll39_buffer_clear(0);
dll39_write_byte(5, 0);
dll39_write_string(_str, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0)};

con_add(_str);
