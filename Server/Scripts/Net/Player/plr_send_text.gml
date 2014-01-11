//makes a text message appear on player's hud
//a0 - id

dll39_buffer_clear(0);
dll39_write_byte(23, 0);
dll39_write_string(argument1, 0); //text
dll39_write_double(argument2, 0); //timer
dll39_write_byte(argument3, 0); //font
dll39_write_int(argument4, 0); //color
dll39_write_double(argument5, 0); //offset x
dll39_write_double(argument6, 0); //offset y
dll39_write_byte(argument7, 0); //if larger than 0, forces text to go in specified array slot

with (global.sv_plr[argument0]) {dll39_message_send(cl_tcp, 0, 0, 0);}
