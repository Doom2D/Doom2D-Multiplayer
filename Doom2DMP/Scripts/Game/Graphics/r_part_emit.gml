//emits particles with type arg0 from (arg1, arg2)
if !global.r_gfx {exit;}

var inst;
switch argument0
{
    case 1:
    case 2:
        if global.r_massacre == 0 {exit;}
        inst = part_emitter_create(global.g_part_sys);
        part_emitter_region(global.g_part_sys, inst, argument1 - 4, argument1 + 4, argument2 - 4, argument2 + 4, ps_shape_rectangle, ps_distr_gaussian);
        part_emitter_burst(global.g_part_sys, inst, global.g_particle[argument0], 2 + irandom(6 - argument0*2));
        part_emitter_destroy(global.g_part_sys, inst);
    break;
    case 3:
    //gibs
        if global.r_massacre != 3 {exit;}
        repeat(7)
        {
            inst = instance_create(argument1, argument2, o_gib);
            inst.speed = 4 + irandom(3);
            inst.direction = random(360);
        }
    break;
    case 4:
    //explosion
        instance_create(argument1, argument2, o_explosion);
    break;
    case 5:
    //plasma splash
        inst = instance_create(argument1, argument2, o_splash);
        inst.image_speed = 0.23;
    break;
    case 6:
    //smoke
        instance_create(argument1, argument2, o_smoke);
    break;
    case 7:
    //respawn splash
        inst = instance_create(argument1, argument2, o_splash);
        inst.sprite_index = s_respawn;
        inst.image_speed = 0.23;
    break;       
    case 8:
    //supersplash
        if !global.r_wsplash {exit;}
        inst = instance_create(argument1, argument2, o_splash);
        inst.sprite_index = s_wsplash;
        inst.image_speed = 0.89;
        inst.image_blend = c_blue;
    break;
    case 9:
    //superdupersplash
        if !global.r_wsplash {exit;}
        inst = instance_create(argument1, argument2, o_splash);
        inst.sprite_index = s_wsplash;
        inst.image_speed = 0.89;
        inst.image_blend = c_lime;
    break;
    case 10:
    //itemrespawn
        inst = instance_create(argument1, argument2, o_splash);
        inst.sprite_index = s_irespawn;
        inst.image_speed = 0.23;
    break;
    case 11:
    //bfg splash
        inst = instance_create(argument1, argument2, o_splash);
        inst.sprite_index = s_bfg_hit;
        inst.image_speed = 0.17;
    break;
}

