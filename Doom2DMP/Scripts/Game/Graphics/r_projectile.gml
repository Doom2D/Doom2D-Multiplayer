//creates a projectile
//arg0 - projectile id
//arg1 - projectile type (coresponds to image index)
//arg2 - direction
//arg3 - x
//arg4 - y
p = instance_create(argument3, argument4, o_projectile);
p.pr_id = argument0;
p.image_single = argument1 - 1;
if argument1 == 1
{
    p.p_spd = 7;
}
if argument1 == 2
{
    p.p_spd = 9;
}
if argument1 == 3
{
    p.p_spd = 10;
}
p.direction = argument2;

ds_list_replace(global.cl_proj, argument0, p.id);

