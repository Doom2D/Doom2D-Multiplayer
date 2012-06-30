//kills a player with id in arg0
var d;
d = id_to_cl(argument0);
if !instance_exists(d) {exit;}

d.hp = 0;
d.killer_id = 0;
d.kill_type = 15;
