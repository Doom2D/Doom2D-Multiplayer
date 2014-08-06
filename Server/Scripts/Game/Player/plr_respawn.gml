spawn = instance_find( o_spawn, irandom( instance_number(o_spawn) - 1 ) );

if global.mp_gamemode == 1 || global.mp_gamemode == 2
{
  if cl_team == 1 && instance_number(o_spawn_r) > 0
  {
    spawn = instance_find( o_spawn_r, irandom( instance_number(o_spawn_r) - 1 ) );
  }
  if cl_team == 2 && instance_number(o_spawn_b) > 0
  {
    spawn = instance_find( o_spawn_b, irandom( instance_number(o_spawn_b) - 1 ) );
  }
}

if !instance_exists(spawn) {exit;}
x = spawn.x + 16;
y = spawn.y + 32;

hp = 100;
ap = 0;

a1 = 50;
a2 = 0;
a3 = 0;
a4 = 0;

hw[0] = 1;
hw[1] = 1;
w = 1;
for (i = 2; i < 10; i += 1) {hw[i] = 0;}

if global.mp_respawn_inv > 0 {st_inv = 1; respinv = true;} else {st_inv = 0; respinv = false;}
st_jet = 0;
st_ber = 0;
st_bpk = 0;
st_vis = 0;
st_suit = 0;

alarm[3] = global.mp_respawn_inv * global.sv_fps_max;

hsp = 0;
vsp = 0;

pt = 0;
cd = 0;
dt = 0;

plr_send_effect(7, x, y);
plr_send_sound(10, x, y);
plr_send_pos();
plr_send_stat();
plr_send_speed();

