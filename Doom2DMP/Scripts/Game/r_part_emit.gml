//emits particles with type arg0 from (arg1, arg2)
if !global.r_gfx {exit;}
switch argument0
{
    case 1:
    //blood
        repeat(4)
        {
            if global.r_massacre == 0 {exit;}
            p = instance_create(argument1, argument2, o_part);
            p.image_blend = c_maroon;
            p.image_xscale = 0.75;
            p.image_yscale = 0.75;
            p.speed = 1+random(1)*choose(1, -1);
            p.direction = random(360);
        }
    break;
    case 2:
    //sparks
        repeat(2)
        {
            p = instance_create(argument1, argument2, o_part);
            p.image_blend = c_yellow;
            p.image_xscale = 0.5;
            p.image_yscale = 0.5;
            p.speed = 1 + random(1)*choose(1, -1);
            p.direction = random(360);
        }
    break;
    case 3:
    //gibs
    if global.r_massacre != 3 {exit;}
        repeat(8)
        {
            g = instance_create(argument1, argument2, o_gib);
            g.speed = 5 + random(5);
            g.direction = random(360);
        }
    break;
    case 4:
    //explosion
        instance_create(argument1, argument2, o_explosion);
    break;
    case 5:
    //plasma splash
        instance_create(argument1, argument2, o_splash);
    break;
    case 6:
    //smoke
        instance_create(argument1, argument2, o_smoke);
    break;
    case 7:
    //bfg splash
        s = instance_create(argument1, argument2, o_splash);
        s.sprite_index = s_splash2;
    break;
}
