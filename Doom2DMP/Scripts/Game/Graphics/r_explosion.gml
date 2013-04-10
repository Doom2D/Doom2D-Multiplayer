//a0 - explosion id
//a1 - explosion type
//a2 - x
//a3 - y
e = instance_create(argument2, argument3, o_explosion);
switch argument1
{
    case 1:
    snd_play_pos(22, argument2, argument3);
    break;
    
    case 2:
    e.sprite_index = s_splash2;
    snd_play_pos(29, argument2, argument3);
    break;
}
e.l_id = argument0;
