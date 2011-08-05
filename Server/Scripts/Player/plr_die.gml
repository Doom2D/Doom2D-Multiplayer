//kills a player
//we drop some weapon
if w == 0 || w == 1 {plr_changewpn(1);}
if kill_type != 12 && w > 1 && global.mp_itemdrop
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    if w >= 5 {o.item = w + 20;} else {o.item = w + 19;}
    o.drop = 1;
    global.sv_itm[i] = o;
    item_send_create(i, o.item, x - 32, y - 16);
}
if kill_type != 12 && st_bpk && global.mp_itemdrop
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 10;
    o.drop = 1;
    global.sv_itm[i] = o;
    item_send_create(i, o.item, x - 32, y - 16);
}
plr_send_dead(killer_id, cl_id, kill_type); 
plr_send_stat(); 
alarm[1] = global.mp_respawn*60; 
x = -9000; 
y = -9000; 
plr_send_pos();    
alarm[2] = 1800;
drown = 0; 
dead = 1;

if !instance_exists(id_to_cl(killer_id)) || killer_id <= 0 || !global.bot_chatter {exit;}
with (id_to_cl(killer_id))
{
    if variable_local_exists('cl_is_bot')
    {
        bot_chat();
    }
}
