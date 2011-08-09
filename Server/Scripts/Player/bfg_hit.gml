//when bfg hits
//execute at bfg ball's destroy event

if !variable_local_exists('l_id') {exit;}

with o_pl
{
    if !variable_local_exists('cl_id') {continue;}
    if dead {continue;}
    if distance_to_point(other.x, other.y) > 256 {continue;}
    if other.l_id == cl_id {continue;}
    if collision_line(x, y, other.x, other.y, o_solid, 0, 0) {continue;}
    if distance_to_point(other.x, other.y) < 96 {dmg = 150;} else {dmg = 100;}

    if !global.mp_godmode && !st_inv
    {
        if ap > 0
        {
            hp -= dmg/2;
            ap -= dmg;
        }
        else
        {
            hp -= dmg;
        }
        if ap < 0 {ap = 0;}
        kill_type = 7;
        killer_id = other.l_id;
    }

    if global.mp_knockback
    {
        if other.x < x {hsp = 6;}
        if other.x > x {hsp = -6;}   
        if other.y > y {vsp = -6;} 
        if other.y < y {vsp = 6;} 
    }

    plr_send_stat();
    plr_send_pain();
    plr_send_speed();
    plr_send_effect(1, x, y);
    plr_send_effect(7, x, y);
}
