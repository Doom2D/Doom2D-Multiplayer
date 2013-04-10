//inits all the shit for client-side networking
var prt, ip, istr;
global.sv_map = 'dm_superdm';
global.sv_maxplayers = 16;
global.sv_name = 'Server';
global.cl_ping = 0;
global.cl_ping_delay = 0;
global.cl_last_ping = 0;
global.cl_inst = o_con;
global.map_w = 0;
global.map_h = 0;
global.map_name = '';
global.map_desc = '';
global.team_score[1] = 0;
global.team_score[2] = 0;
global.debug_counter = 0;
if global.dem_b == -1 {global.dem_b = dycreatebuffer();}

for(i=0; i < 255; i+=1)
{
    global.cl_plr[i] = noone;
}
for(i=0; i < 8192; i+=1)
{
    global.cl_itm[i] = noone;
}

ds_list_destroy(global.cl_tiles);
global.cl_tiles = ds_list_create();

con_parse('cls');

if global.dem_will == 'PLAY' {demo_play();}

if global.dem_mode >= 2 {exit;}

//divide the ip string
istr = string_explode(global.sv_ip, ':', false);
if is_real(ds_list_find_value(istr, 0))
{
    con_add(":: NET: Неверный адрес.");
    dyclosesock(global.cl_tcp);
    mus_play(global.mus_menu);
    room_goto(rm_menu);
    ds_list_destroy(istr);
    exit;
}
ip = ds_list_find_value(istr, 0);
prt = real(ds_list_find_value(istr, 1));
if prt == 0 {prt = 25666;}
ds_list_destroy(istr);

//try to connect
con_add(":: NET: Пытаемся соединиться с " + string(ip) + ":" + string(prt) + "...");
screen_redraw();
global.cl_tcp = dytcpconnect(ip, prt, true);

if !dytcpconnected(global.cl_tcp)
{
    //did not connect
    con_add(':: NET: ERROR: Невозможно соединиться с ' + string(ip) + ':' + string(prt)); 
    dyclosesock(global.cl_tcp);
    mus_play(global.mus_menu);
    room_goto(rm_menu);
    exit;
}
else
{
    if global.dem_will == 'ДА' {demo_rec();}
    
    //did connect
    dysetnagle(global.cl_tcp, 1);
    con_add(':: NET: Успешно присоединились к ' + string(ip) + ':' + string(prt));
    
    //send our shit to host
    dyclearbuffer(0);
    dywritestring(global.pl_name, 0);
    dywritestring(global.pl_skin, 0);
    dywriteint(global.pl_color, 0);
    dywritebyte(global.pl_team, 0);
    dywritestring(global.sys_ver, 0);
    dywritestring(global.sys_bld, 0);
    dywritestring(global.sv_password, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
    con_add(':: NET: Отослана информация о клиенте.');
}

//done



