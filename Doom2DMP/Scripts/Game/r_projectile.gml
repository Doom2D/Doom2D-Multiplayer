//creates a projectile
//arg0 - launcher id
//arg1 - projectile type (coresponds to image index)
//arg2 - direction
//arg3 - x
//arg4 - y
p = instance_create(argument3, argument4, o_projectile);
p.l_id = argument0;
p.image_single = argument1 - 1;
if argument1 == 1 || argument1 == 3
{
    p.p_spd = 7;
}
else
{
    p.p_spd = 8;
}
p.direction = argument2;
