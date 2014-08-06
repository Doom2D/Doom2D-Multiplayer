//sends kick message to player with id arg 0 with reason arg1
if !instance_exists(id_to_cl(argument0)) || argument0 < 1 {exit;}
dll39_buffer_clear(0);
write_msg_id(2, 0);
dll39_write_string(string(argument1), 0);
with (id_to_cl(argument0)) {dll39_message_send(cl_tcp, 0, 0, 0);}

con_add(":: Кикнут клиент " + string(id_to_cl(argument0).cl_name) + "[" + string(id_to_cl(argument0).cl_id) + "]: " + argument1);
with global.sv_plr[argument0] {instance_destroy();}      
global.sv_plr[argument0] = noone;
    
//send this to other clients
dll39_buffer_clear(0);
write_msg_id(4, 0);
dll39_write_byte(argument0, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
