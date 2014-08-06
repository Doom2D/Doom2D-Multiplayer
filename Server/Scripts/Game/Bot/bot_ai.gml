//bot's ai
if global.bot_dummy {kb_jump = 0; kb_left = 0; kb_rght = 0; exit;}

var target; //object to follow
//jt -= 1;

//basic aiming stuff, do not change
if kb_left == 1 {aim = -1;}
if kb_rght == 1 {aim = 1;}

//if kb_jump && jt > 0 {kb_jump = 0;}
//if kb_jump && jt < 1 {kb_jump = 0; jt = global.bot_randrate * random(2);}

target = noone;
if hp > 25 || !global.bot_cowardly
{
  if global.mp_gamemode == GAME_DM {target = bot_find_player();} else {target = bot_find_player_team();}
}
if target == noone { target = bot_find_health(); }

if !bot_check_ammo() {plr_changewpn(2);}

if (hw[2] && a2 > 0 ) ||
   (hw[3] && a2 > 1 ) ||
   (hw[4] && a1 > 0 ) ||
   (hw[5] && a3 > 0 ) ||
   (hw[6] && a4 > 0 ) ||
   (hw[7] && a4 > 39) ||
   (hw[8] && a2 > 1 ) && w < 2 {plr_changewpn(1);}     
if hw[9] && w == 0 {w = 9;}
if global.mp_waterfrag != 0 { if place_meeting(x, y, o_water) && (w == 6 || w == 7) {plr_changewpn(1);} }

//basic obstacle avoiding
if ( place_meeting(x + sign(hsp), y     , o_solid)   &&
    !place_meeting(x + sign(hsp), y - 64, o_solid) ) || place_meeting(x, y     , o_jthr) ||
                                                        place_meeting(x, y - 64, o_jthr) ||
                                                        !place_meeting(x + sign(hsp), y + 1, o_solid) {kb_jump = 1;} else {kb_jump = 0;}
if place_meeting(x + 16, y     , o_solid) &&
   place_meeting(x + 16, y - 16, o_solid) &&
   place_meeting(x + 16, y + 16, o_solid) { kb_left = 1;
                                            kb_rght = 0; }
if place_meeting(x - 16, y     , o_solid) &&
   place_meeting(x - 16, y - 16, o_solid) &&
   place_meeting(x - 16, y + 16, o_solid) { kb_left = 0;
                                            kb_rght = 1; }
if place_meeting(x + 24, y, o_lift_left ) && kb_rght {kb_left = 1; kb_rght = 0;}
if place_meeting(x - 24, y, o_lift_right) && kb_left {kb_rght = 1; kb_left = 0;}

if irandom(global.bot_randrate) == 1
{
  switch choose(1, 2, 3)
  {
    case 1: kb_left = 1; kb_rght = 0; kb_jump = 0; break;
    case 2: kb_left = 0; kb_rght = 1; kb_jump = 0; break;
  }
  if irandom( ceil(global.bot_randrate / 5) ) == 1 {kb_jump = 1;} else {kb_jump = 0;}
}

if irandom(global.bot_userate) == 1 { plr_use(); }

if !instance_exists(target) {exit;} //if target does not exist, fuck the shit
if collision_line(x, y, target.x, target.y, o_solid, 0, 1)
{
  //if player is not in sight
  kb_lkup = 0; kb_lkdn = 0;
  if target.y > y + 16 || target.y < y - 16 {exit;}
} else {
  //if he is in sight, run to him
  if target.x < x - 32 {kb_left = 1; kb_rght = 0;} else if target.x > x + 32 {kb_left = 0; kb_rght = 1;}
  if target.y < y - 24 {kb_jump = 1;} else {kb_jump = 0;}

  //and kill him
  if target.object_index == o_pl
  {
    if point_distance(x, y, target.x, target.y) < 2048
    {
      if target.y < y - 24 {kb_lkup = 1; kb_lkdn = 0;}
      if target.y > y + 24 {kb_lkup = 0; kb_lkdn = 1;}
      if target.y < y + 24 && target.y > y - 24 {kb_lkup = 0; kb_lkdn = 0;}
      if point_distance(x, y, target.x, target.y) < 12 {if hw[9] {w = 9;} else {w = 0;}}
      if point_distance(x, y, target.x, target.y) > 32 && (w == 0 || w == 9) {plr_changewpn();}
      plr_shoot();
    }
  }
}

