//adds a new player
//argument0 - id
//argument1 - socket
//argument2 - name
//argument3 - skin
//argument4 - color
//argument5 - is bot
//argument6 - team (only if teamplay is on)
//returns instance id

var cl_inst;
//create new client
cl_inst = instance_create(0, 0, o_pl);
if argument5
{
    cl_inst.cl_is_bot = true;
}
cl_inst.cl_id = argument0;
cl_inst.cl_tcp = argument1;
cl_inst.cl_name = argument2;
cl_inst.cl_skin = argument3;
cl_inst.cl_color = argument4;
cl_inst.cl_team = argument6;
global.sv_plr[i] = cl_inst;

if global.mp_gamemode
{
    if argument6 == 1 {cl_inst.cl_color = c_red;}
    if argument6 == 2 {cl_inst.cl_color = c_blue;}
}

//let everyone know about this fucker
dyclearbuffer(0);
dywritebyte(3, 0);
dywritebyte(argument0, 0);
dywritebyte(argument6, 0);
dywritestring(argument2, 0);
dywritestring(argument3, 0);
dywriteint(cl_inst.cl_color, 0);
with(o_pl)
{
    if id != cl_inst
    {
        dysendmessage(cl_tcp, 0, 0, 0);
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

//and return his instance
return cl_inst;
