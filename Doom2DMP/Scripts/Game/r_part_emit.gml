//emits particles with type arg0 from (arg1, arg2)
if !global.r_gfx {exit;}
switch argument0
{
    case 1:
    case 2:
        if global.r_massacre == 0 {exit;}
        var _emitter;
        _emitter = part_emitter_create(global.g_part_sys);
        part_emitter_region(global.g_part_sys, _emitter, argument1 - 4, argument1 + 4, argument2 - 4, argument2 + 4, ps_shape_rectangle, ps_distr_gaussian);
        part_emitter_burst(global.g_part_sys, _emitter, global.g_particle[argument0], 2 + irandom(6 - argument0*2));
        part_emitter_destroy(global.g_part_sys, _emitter);
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
    //respawn splash
        s = instance_create(argument1, argument2, o_splash);
        s.sprite_index = s_respawn;
    break;       
}
