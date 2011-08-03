var spawn, number;
number = round(random(instance_number(o_spawn)));


spawn = instance_nearest_nth(0, 0, o_spawn, number);

if !instance_exists(spawn) {spawn = instance_nearest(0, 0, o_spawn);}
x = spawn.x + 17;
y = spawn.y + 26;

hp = 100;
ap = 0;

a1 = 50;
a2 = 0;
a3 = 0;
a4 = 0;

w = 1;

st_inv = 0;
st_jet = 0;
st_ber = 0;
st_bpk = 0;

hw[0] = 1;
hw[1] = 1;

hsp = 0;
vsp = 0;

drown = 0;

for (i = 2; i < 10; i += 1) {hw[i] = 0;}

plr_send_effect(5, x, y);
plr_send_sound(9, x, y);
plr_send_pos();
plr_send_stat();
plr_send_speed();
