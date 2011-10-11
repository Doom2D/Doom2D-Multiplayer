//bot's ai
if global.bot_dummy {kb_jump = 0; kb_left = 0; kb_rght = 0; exit;}
var target; //object to follow

//basic aiming stuff, do not change
if kb_left == 1 {aim = -1;}
if kb_rght == 1 {aim = 1;}

target = noone;
if (hp > 25) || !global.bot_cowardly {target = instance_nearest_nth(x, y, o_pl, 2);} else {target = instance_find_health();} //is furthest player from our position
if !bot_check_ammo() {plr_changewpn(2);}
if !instance_exists(target) {exit;} //if target does not exist, fuck the shit

if random(10) < global.bot_randrate {exit;} else {kb_jump = 0;}
if (hw[2] && a2 > 0) || (hw[3] && a2 >= 2) || (hw[4] && a1 > 0) || (hw[5] && a3 > 0) ||  (hw[6] && a4 > 0) ||  (hw[7] && a4 >= 40) || (hw[8] && a2 >= 4) && w < 2 {plr_changewpn(1);}     
if hw[9] && w == 0 {w = 9;}

//basic obstacle avoiding
if place_meeting(x + hsp + 30*sign(hsp), y, o_solid) || (!place_meeting(x + hsp + 30*sign(hsp), y + 128, o_solid) && !place_meeting(x + hsp + 30*sign(hsp), y + 4, o_solid)) {kb_jump = 1;} else {kb_jump = 0;}
if place_meeting(x + 16, y, o_solid) && place_meeting(x + 16, y - 32, o_solid) && place_meeting(x + 16, y - 16, o_solid) && place_meeting(x + 16, y + 16, o_solid) {kb_left = 1; kb_rght = 0;}
if place_meeting(x - 16, y, o_solid) && place_meeting(x - 16, y - 32, o_solid) && place_meeting(x - 16, y - 16, o_solid) && place_meeting(x - 16, y + 16, o_solid) {kb_left = 0; kb_rght = 1;}
if place_meeting(x + 24, y, o_lift_left) && kb_rght {kb_left = 1; kb_rght = 0;}
if place_meeting(x - 24, y, o_lift_right) && kb_left {kb_rght = 1; kb_left = 0;}

//if player is not in sight
if collision_line(x, y, target.x, target.y, o_solid, 0, 1) {kb_lkup = 0; kb_lkdn = 0; exit;}

//if he is in sight, run to him
if target.x < x {kb_left = 1; kb_rght = 0;}
if target.x > x {kb_left = 0; kb_rght = 1;}
if target.y < y - 24 {kb_jump = 1;} else {kb_jump = 0;}

//and kill him
if point_distance(x, y, target.x, target.y) < 1024 && target.object_index == o_pl
{
    if target.y < y - 24 {kb_lkup = 1; kb_lkdn = 0;}
    if target.y > y + 24 {kb_lkup = 0; kb_lkdn = 1;}
    if target.y < y + 24 && target.y > y - 24 {kb_lkup = 0; kb_lkdn = 0;}
    if point_distance(x, y, target.x, target.y) < 12 {if hw[9] {w = 9;} else {w = 0;}}
    if point_distance(x, y, target.x, target.y) > 32 && (w == 0 || w == 9) {plr_changewpn();}
    plr_shoot();
}

