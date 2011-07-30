var spawn, number;
number = round(random(instance_number(o_spawn)));
if number < 1 {number = 1;}
spawn = instance_nearest_nth(0, 0, o_spawn, number);
if !instance_exists(spawn) {spawn = instance_nearest(0, 0, o_spawn);}
x = spawn.x + 16;
y = spawn.y + 32;
