//similar to plr_speed_add(), but also inverts original speed
//arg0 - speed
//arg1 - direction

hsp = ( argument0 + abs(hsp) ) *  cos( degtorad(argument1) );
vsp = ( argument0 + abs(vsp) ) * -sin( degtorad(argument1) );
