//creates a corpse of a player with id arg0 at arg1, arg2
if global.r_massacre < 2 {exit;}
var corpse, victim;
victim = id_to_cl(argument0);
if !instance_exists(victim) {exit;}
corpse = instance_create(argument1, argument2, o_corpse);
corpse.sprite_index = victim.sprites[9, 0];
corpse.msk = victim.sprites[9, 1];
corpse.image_xscale = victim.image_xscale;
corpse.color = victim.cl_color;
//corpse.hspeed = victim.hsp;
//corpse.vspeed = victim.vsp;
