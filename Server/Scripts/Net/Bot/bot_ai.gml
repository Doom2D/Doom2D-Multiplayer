//bot's ai
var target; //object to follow
target = noone;
if (hp > 25) || !global.bot_cowardly {target = instance_nearest_nth(x, y, o_pl, 2);} else {target = instance_find_health();} //is furthest player from our position
if !bot_check_ammo() {plr_changewpn();}
if !instance_exists(target) {exit;} //if target does not exist, fuck the shit

if random(10) < global.bot_randrate {exit;} else {kb_jump = 0;}

//basic obstacle avoiding
if place_meeting(x + hsp + 30*sign(hsp), y, o_solid) || (!place_meeting(x + hsp + 30*sign(hsp), y + 128, o_solid) && !place_meeting(x + hsp + 30*sign(hsp), y + 4, o_solid)) {kb_jump = 1;} else {kb_jump = 0;}
if place_meeting(x + 16, y, o_solid) && place_meeting(x + 16, y - 32, o_solid) && place_meeting(x + 16, y - 16, o_solid) && place_meeting(x + 16, y + 16, o_solid) {kb_left = 1; kb_rght = 0;}
if place_meeting(x - 16, y, o_solid) && place_meeting(x - 16, y - 32, o_solid) && place_meeting(x - 16, y - 16, o_solid) && place_meeting(x - 16, y + 16, o_solid) {kb_left = 0; kb_rght = 1;}

//if player is not in sight
if collision_line(x, y, target.x, target.y, o_solid, 0, 1) {kb_lkup = 0; kb_lkdn = 0; exit;}

//if he is in sight, run to him
if target.x < x - 2 {kb_left = 1; kb_rght = 0;}
if target.x > x + 2 {kb_left = 0; kb_rght = 1;}
if target.y < y - 16 {kb_jump = 1;}

//and kill him
if distance_to_object(target) < 1024 && target.object_index == o_pl
{
    if target.y < y - 16 {kb_lkup = 1; kb_lkdn = 0;}
    if target.y > y + 16 {kb_lkup = 0; kb_lkdn = 1;}
    if target.y < y + 16 && target.y > y - 16 {kb_lkup = 0; kb_lkdn = 0;}
    if distance_to_object(target) < 32 && (w == 5 || w == 7) && global.bot_cowardly {if hw[9] {w = 9;} else {w = 1;};}
    if distance_to_object(target) > 256 && (w == 0 || w == 9) {plr_changewpn();}
    plr_shoot();
}

if kb_left == 1 {aim = -1;}
if kb_rght == 1 {aim = 1;}
    

