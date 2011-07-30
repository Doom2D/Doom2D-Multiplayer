//inits all the shit for client-side networking
global.sv_port = 25666;
global.sv_port2 = 25667;
global.sv_map = 'dm_superdm';
global.sv_maxplayers = 16;
global.sv_name = 'Server';
global.cl_ping = 0;
global.cl_ping_delay = 0;
global.cl_last_ping = 0;
global.cl_inst = o_con;
global.map_w = 0;
global.map_h = 0;

for(i=0; i < 255; i+=1)
{
    global.cl_plr[i] = -1;
}
for(i=0; i < 24000; i+=1)
{
    global.cl_itm[i] = noone;
}

//try to connect
con_add(":: NET: Trying to connect to " + global.sv_ip + ":" + string(global.sv_port) + "...");
screen_redraw();
global.cl_tcp = dll39_tcp_connect(global.sv_ip, global.sv_port, 1);

if !dll39_tcp_connected(global.cl_tcp)
{
    //did not connect
    con_add(':: NET ERROR: Could not connect to ' + string(global.sv_ip) + ':' + string(global.sv_port)); 
    dll39_socket_close(global.cl_tcp);
    room_goto(rm_menu);
}
else
{
    //did connect
    dll39_set_nagle(global.cl_tcp, 1);
    con_add(':: NET: Connected to ' + string(global.sv_ip) + ':' + string(global.sv_port));
    
    //send our shit to host
    dll39_buffer_clear(0);
    dll39_write_string(global.pl_name, 0);
    dll39_write_string(global.pl_skin, 0);
    dll39_write_int(global.pl_color, 0);
    dll39_write_string(global.sys_ver, 0);
    dll39_write_string(global.sys_bld, 0);
    dll39_write_string(global.sv_password, 0);
    dll39_message_send(global.cl_tcp, 0, 0, 0);
    con_add(':: NET: Sent client info.');
}

//done



