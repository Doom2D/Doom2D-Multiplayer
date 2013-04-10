//sends kick message to player with id arg 0 with reason arg1
if !instance_exists(id_to_cl(argument0)) || argument0 < 1 {exit;}
dyclearbuffer(0);
dywritebyte(2, 0);
dywritestring(string(argument1), 0);
with (id_to_cl(argument0)) {dysendmessage(cl_tcp, 0, 0, 0);}

con_add(":: Кикнут клиент " + string(id_to_cl(argument0).cl_name) + "[" + string(id_to_cl(argument0).cl_id) + "]: " + argument1);
with global.sv_plr[argument0] {instance_destroy();}      
global.sv_plr[argument0] = noone;
    
//send this to other clients
dyclearbuffer(0);
dywritebyte(4, 0);
dywritebyte(argument0, 0);
with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0);}
