//kills a player
//we drop some weapon
item_drop();
plr_send_dead(killer_id, cl_id, kill_type); 
plr_send_stat(); 
if global.mp_respawn > 0 {alarm[1] = global.mp_respawn * global.sv_fps_max;}
x = -9000; 
y = -9000; 
plr_send_pos();    
alarm[2] = 1800;
drown = 0; 
dead = 1;

if !instance_exists(id_to_cl(killer_id)) || killer_id <= 0 || killer_id == cl_id || !global.bot_chatter {exit;}
with (id_to_cl(killer_id))
{
    if variable_local_exists('cl_is_bot')
    {
        bot_chat();
    }
}
