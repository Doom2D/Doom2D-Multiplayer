//this sets player speed in specified direction
//arg0 - speed
//arg1 - direction

hsp = argument0 *  cos( degtorad(argument1) );
vsp = argument0 * -sin( degtorad(argument1) );
