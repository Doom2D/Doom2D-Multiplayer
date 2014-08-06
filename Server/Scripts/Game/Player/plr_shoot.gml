//makes player shoot some shit according to current weapon

if cd > 0 {exit;}
if dead {exit;}
if respinv {exit;}

b_dir = plr_aim();

switch w
{
    case 0:
        //punch
        b = instance_create(x, y, o_punch);
        b.p_id = cl_id;
        b.p_t = 0;
        b.p_team = cl_team;
        b.image_angle = b_dir;
        b.dmg = 10 + 20 * st_ber;
        b.kb = st_ber;
        plr_send_stat();
        plr_send_sound(17, x, y);
        cd = 20 - 5 * st_ber;
    break;
    case 1:
        //pistol
        if a1 < 1 {exit;}
        b = instance_create(x, y, o_bullet);
        b.a_id = cl_id;
        b.a_i_id = id;
        b.a_team = cl_team;
        b.direction = b_dir + irandom_range(-2, 2);
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
            b.a_team = cl_team;
            b.dmg = 8;
            b.direction = b_dir + irandom_range(-5, 5);
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
            b.a_team = cl_team;
            b.dmg = 10 + irandom(3);
            b.direction = b_dir + irandom_range(-12, 12);
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
        b.a_team = cl_team;
        b.direction = b_dir + irandom_range(-3, 3);
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
        p.l_team = cl_team;
        p.pr_id = ds_list_find_index(global.sv_proj, noone);
        ds_list_replace(global.sv_proj, p.pr_id, p.id);
        a3 -= 1;
        plr_send_stat();
        plr_send_sprite(cl_id, 1, 0);
        with p {plr_send_projectile(1, other.b_dir, x, y);}
        plr_send_sound(14, x, y);
        cd = 40;
    break;
    case 6:
        //plasmagun
        if a4 < 1 {exit;}
        if position_meeting(x, y, o_water) && global.mp_waterfrag == 1
        {
            killer_id = cl_id; 
            kill_type = 6;
            plr_hurt(10);
            plr_send_pain();
        }
        else
        {
            p = instance_create(x, y, o_projectile);
            p.l_id = cl_id;
            p.direction = b_dir;
            p.p_type = 2;
            p.p_spd = 9;
            p.l_team = cl_team;
            p.pr_id = ds_list_find_index(global.sv_proj, noone);
            ds_list_replace(global.sv_proj, p.pr_id, p.id);
            with p {plr_send_projectile(2, other.b_dir, x, y);}
        }
        plr_send_sprite(cl_id, 1, 0);
        a4 -= 1;
        plr_send_stat();
        plr_send_sound(15, x, y);
        cd = 5;
    break;
    case 7:
        //bfg
        if a4 < 40 {exit;}
        alarm[5] = 60;    
        plr_send_sound(33, x, y);
        cd = 130;
    break;
    case 8:
        //superchaingun
        if a2 < 1 {exit;}
        repeat (2)
        {
            b = instance_create(x, y, o_bullet);
            b.a_id = cl_id;
            b.a_i_id = id;
            b.a_team = cl_team;
            b.dmg = 10;
            b.direction = b_dir + irandom_range(-4, 4);
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
        b.p_team = cl_team;
        b.image_angle = b_dir;
        b.dmg = 16;
        b.kb = -1;
        plr_send_stat();
        if ct < 1 {plr_send_sound(18, x, y); ct = 100;}
        cd = 5;
    break;
}

