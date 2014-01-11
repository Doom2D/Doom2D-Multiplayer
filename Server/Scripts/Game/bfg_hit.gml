//when bfg hits
//execute at bfg ball's destroy event

if !variable_local_exists('l_id') {exit;}

with o_pl
{
  if !variable_local_exists('cl_id') {continue;}
  if dead {continue;}
  if other.l_id == cl_id {continue;}
  if distance_to_object(other) > 256 {continue;}
  if collision_line(x, y, other.x, other.y, o_solid, 0, 1) {continue;}

  if place_meeting(x, y, other.id)
  {
    dmg = 150;
    if global.mp_knockback { plr_speed_inv(20, other.direction); }
  } else {
    if collision_line(x, y, other.x, other.y, o_jthr, 0, 1) && y > other.y {continue;}
    dmg = 50;
    plr_send_effect(11, x, y);
    plr_send_sound(25, x, y);
  }

  if !global.mp_godmode && !st_inv
  {
    if !global.mp_gamemode || global.mp_ffire || cl_team != other.l_team
    {
      killer_id = other.l_id;
      kill_type = 7;
      plr_hurt(dmg);
    }
  }

  plr_send_stat();
  if !global.mp_godmode && !st_inv {plr_send_pain();}
  plr_send_speed();
  plr_send_effect(1, x, y);
}
