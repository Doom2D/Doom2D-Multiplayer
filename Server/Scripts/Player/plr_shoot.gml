//makes player shoot some shit according to current weapon
if cd > 0 {exit;}
if dead {exit;}
if aim == 1 && !kb_lkup && !kb_lkdn {b_dir = 0;}
if aim == -1 && !kb_lkup && !kb_lkdn {b_dir = 180;}
if !global.mp_oldaim
{
    if aim == 1 && kb_lkdn {b_dir = 315;}
    if aim == -1 && kb_lkdn {b_dir = 225;}
    if aim == 1 && kb_lkup {b_dir = 45;}
    if aim == -1 && kb_lkup {b_dir = 135;}
}
else
{
    if aim == 1 && kb_lkdn {b_dir = 325;}
    if aim == -1 && kb_lkdn {b_dir = 215;}
    if aim == 1 && kb_lkup {b_dir = 55;}
    if aim == -1 && kb_lkup {b_dir = 125;}
}

switch w
{
    case 0:
        //punch
        b = instance_create(x, y, o_punch);
        b.p_id = cl_id;
        b.p_t = 0;
        b.image_angle = b_dir;
        b.dmg = 9 + st_ber * 11;
        b.kb = st_ber;
        b.alarm[0] = 2;
        plr_send_stat();
        plr_send_sound(17, x, y);
        cd = 20;
    break;
    case 1:
        //pistol
        if a1 < 1 {exit;}
        b = instance_create(x, y, o_bullet);
        b.a_id = cl_id;
        b.a_i_id = id;
        b.direction = b_dir;
        b.dmg = 9;
        b.k_t = 1;
        a1 -= 1;
        plr_send_stat();
        plr_send_sprite(cl_id, 1, 0);
        plr_send_sound(11, x, y);
        cd = 20;
    break;
    case 2:
        //shotgun
        if a2 < 1 {exit;}
        repeat (4)
        {
            b = instance_create(x, y, o_bullet);
            b.a_id = cl_id;
            b.a_i_id = id;
            b.dmg = 8;
            b.direction = b_dir + random(10) - random(10);
            b.k_t = 2;
        }
        a2 -= 1;
        plr_send_stat();
        plr_send_sprite(cl_id, 1, 0);
        plr_send_sound(12, x, y);
        cd = 50;
    break;
    case 3:
        //super shotgun
        if a2 < 2 {exit;}
        repeat (8)
        {
            b = instance_create(x, y, o_bullet);
            b.a_id = cl_id;
            b.a_i_id = id;
            b.dmg = 10;
            b.direction = b_dir + random(20) - random(20);
            b.k_t = 3;
        }
        a2 -= 2;
        plr_send_stat();
        plr_send_sprite(cl_id, 1, 0);
        plr_send_sound(13, x, y);
        cd = 100;
    break;
    case 4:
        //chaingun
        if a1 < 1 {exit;}
        b = instance_create(x, y, o_bullet);
        b.a_id = cl_id;
        b.a_i_id = id;
        b.direction = b_dir + random(3) - random(3);
        b.dmg = 6;
        b.k_t  = 4;
        a1 -= 1;
        plr_send_stat();
        plr_send_sprite(cl_id, 1, 0);
        plr_send_sound(11, x, y);
        cd = 6;
    break;
    case 5:
        //rocketlauncher
        if a3 < 1 {exit;}
        p = instance_create(x, y, o_projectile);
        p.l_id = cl_id;
        p.direction = b_dir;
        p.p_type = 1;
        p.p_spd = 7;
        a3 -= 1;
        plr_send_stat();
        plr_send_sprite(cl_id, 1, 0);
        plr_send_projectile(cl_id, 1, b_dir, x, y);
        plr_send_sound(14, x, y);
        cd = 40;
    break;
    case 6:
        //plasmagun
        if a4 < 1 {exit;}
        if !place_meeting(x, y - 15, o_water) && !place_meeting(x, y - 15, o_acid)
        {  
            p = instance_create(x, y, o_projectile);
            p.l_id = cl_id;
            p.direction = b_dir;
            p.p_type = 2;
            p.p_spd = 8.5;
            plr_send_projectile(cl_id, 2, b_dir, x, y);
            plr_send_sprite(cl_id, 1, 0);
        }
        else
        {
            if !global.mp_godmode && !st_inv
            {
            if ap > 0
            {
                hp -= 7;
                ap -= 15;
            }
            else
            {  
                hp -= 15;
            }
            }
            if ap < 0 {ap = 0;}
            if pt < 1 {plr_send_sound(7, x, y); plr_send_sprite(cl_id, 0, 1); pt = 32;}
            plr_send_effect(1, x, y);
            killer_id = cl_id;
            kill_type = 6;
        }
        a4 -= 1;
        plr_send_stat();
        plr_send_sound(15, x, y);
        cd = 5;
    break;
    case 7:
        //bfg
        if a4 < 40 {exit;}
        a4 -= 40;
        alarm[5] = 50;     
        plr_send_stat();
        plr_send_sound(16, x, y);
        cd = 120;
    break;
    case 8:
        //superchaingun
        if a2 < 1 {exit;}
        repeat (2)
        {
            b = instance_create(x, y, o_bullet);
            b.a_id = cl_id;
            b.a_i_id = id;
            b.dmg = 15;
            b.direction = b_dir + random(5) - random(5);
            b.k_t = 8;
        }
        a2 -= 1;
        plr_send_stat();
        plr_send_sprite(cl_id, 1, 0);
        plr_send_sound(23, x, y);
        cd = 7;
    break;
    case 9:
        //saw
        b = instance_create(x, y, o_punch);
        b.p_id = cl_id;
        b.p_t = 1;
        b.image_angle = b_dir;
        b.dmg = 12 + st_ber * 8;
        b.kb = st_ber;
        b.alarm[0] = 2;
        plr_send_stat();
        if ct < 1 {plr_send_sound(18, x, y); ct = 100;}
        cd = 5;
    break;
}

