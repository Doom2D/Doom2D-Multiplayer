//makes a text message appear on player's hud
//a0 - id

dyclearbuffer(0);
dywritebyte(23, 0);
dywritestring(argument1, 0); //text
dywritedouble(argument2, 0); //timer
dywritebyte(argument3, 0); //font
dywriteint(argument4, 0); //color
dywritedouble(argument5, 0); //offset x
dywritedouble(argument6, 0); //offset y
dywritebyte(argument7, 0); //if larger than 0, forces text to go in specified array slot

with (global.sv_plr[argument0]) {dysendmessage(cl_tcp, 0, 0, 0);}
