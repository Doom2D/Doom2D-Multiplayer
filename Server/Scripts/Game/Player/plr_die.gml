//kills a player
//we drop some weapon
deaths += 1;

item_drop();
plr_send_dead(killer_id, cl_id, kill_type); 
plr_send_stat(); 
if global.mp_respawn > 0 {alarm[1] = global.mp_respawn * global.sv_fps_max;} else {alarm[1] = 1;}
x = -9000;
y = -9000;
plr_send_pos();    
drown = 0; 
dead = 1;

if instance_exists( id_to_cl(killer_id) ) && killer_id > 0
{
  if killer_id == cl_id
  {
    plr_send_text(cl_id, 'Произошел несчастный случай.', global.mp_respawn, 2, c_white, 412, 724, 2);
  } else {
    plr_send_text(cl_id, 'Вас убил#' + string(id_to_cl(killer_id).cl_name), global.mp_respawn, 2, c_white, 412, 724, 2);
  }
} else {
  plr_send_text(cl_id, 'Вы погибли.', global.mp_respawn, 2, c_white, 412, 724, 2);
}

with o_plugin
{
  last_scored = id_to_cl(other.killer_id);
  last_died = other.id;
  plug_exec(PLUG_ONFRAG);
}

if !instance_exists(id_to_cl(killer_id)) || killer_id <= 0 || killer_id == cl_id || !global.bot_chatter {exit;}
with id_to_cl(killer_id) { if cl_is_bot { bot_chat(); } }
