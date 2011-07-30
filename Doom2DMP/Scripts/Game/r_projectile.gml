//creates a projectile
//arg0 - launcher id
//arg1 - projectile type (coresponds to image index)
//arg2 - direction
//arg3 - x
//arg4 - y
p = instance_create(argument3, argument4, o_projectile);
p.l_id = argument0;
p.image_single = argument1 - 1;
p.p_spd = 7 + argument1;
p.direction = argument2;
