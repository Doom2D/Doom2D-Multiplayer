//adds a new player
//argument0 - id
//argument1 - socket
//argument2 - name
//argument3 - skin
//argument4 - color
//argument5 - is bot
//argument6 - team (only if teamplay is on)
//argument7 - ip
//returns instance id

var cl_inst;
//create new client
cl_inst = instance_create(0, 0, o_pl);
cl_inst.cl_id = argument0;
cl_inst.cl_tcp = argument1;
cl_inst.cl_name = argument2;
cl_inst.cl_skin = argument3;
cl_inst.cl_color = argument4;
cl_inst.cl_is_bot = argument5
cl_inst.cl_team = argument6;
cl_inst.cl_ip = argument7;
global.sv_plr[argument0] = cl_inst;

if global.mp_gamemode
{
    if argument6 == 1 {cl_inst.cl_color = c_red;}
    if argument6 == 2 {cl_inst.cl_color = c_blue;}
}

//let everyone know about this fucker
dll39_buffer_clear(0);
write_msg_id(3, 0);
dll39_write_byte(argument0, 0);
dll39_write_string(argument2, 0);
dll39_write_byte(argument6, 0);
dll39_write_string(argument3, 0);
dll39_write_int(cl_inst.cl_color, 0);
with(o_pl)
{
    if id != cl_inst
    {
        dll39_message_send(cl_tcp, 0, 0, 0);
    }
}

//we respawn him
if argument5 || !global.sv_dl_allow {with cl_inst {plr_respawn();};}

//and send his position
with cl_inst {plr_send_pos();}

//and his stats
with cl_inst {plr_send_stat();}

//add his nick to taken nick list
list_add('name_taken', argument2);

//alert plugins
with o_plugin
{
    if argument5 break;
    last_plr = cl_inst;
    last_plr_name = argument2;
    last_plr_ip = argument7;
    last_plr_id = argument0;
    plug_exec(PLUG_ONCONNECT);
}

//and return his instance
return cl_inst;
