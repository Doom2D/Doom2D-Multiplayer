//adds a new player
//argument0 - id
//argument1 - socket
//argument2 - name
//argument3 - skin
//argument4 - color
//argument5 - is bot
//returns instance id

var cl_inst;
//create new client
cl_inst = instance_create(instance_nearest(0, 0, o_spawn).x, instance_nearest(0, 0, o_spawn).y, o_pl);
if argument5
{
    cl_inst.cl_is_bot = true;
}
cl_inst.cl_id = argument0;
cl_inst.cl_tcp = argument1;
cl_inst.cl_name = argument2;
cl_inst.cl_skin = argument3;
cl_inst.cl_color = argument4;
global.sv_plr[i] = cl_inst;

//let everyone know about this fucker
dll39_buffer_clear(0);
dll39_write_byte(3, 0);
dll39_write_byte(argument0, 0);
dll39_write_string(argument2, 0);
dll39_write_string(argument3, 0);
dll39_write_int(argument4, 0);
with(o_pl)
{
    if id != cl_inst
    {
        dll39_message_send(cl_tcp, 0, 0, 0);
    }
}

//we respawn him
with cl_inst {plr_respawn();}

//and send his position
with cl_inst {plr_send_pos();}

//and his stats
with cl_inst {plr_send_stat();}

//and return his instance
return cl_inst;
