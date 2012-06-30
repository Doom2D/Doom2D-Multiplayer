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

for(i=0; i < 255; i+=1)
{
    global.cl_plr[i] = noone;
}
for(i=0; i < 8192; i+=1)
{
    global.cl_itm[i] = noone;
}

con_parse('cls');

//divide the ip string
istr = string_explode(global.sv_ip, ':', false);
if is_real(ds_list_find_value(istr, 0))
{
    con_add(":: NET: Неверный адрес.");
    dll39_socket_close(global.cl_tcp);
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
global.cl_tcp = dll39_tcp_connect(ip, prt, 1);

if !dll39_tcp_connected(global.cl_tcp)
{
    //did not connect
    con_add(':: NET: ERROR: Невозможно соединиться с ' + string(ip) + ':' + string(prt)); 
    dll39_socket_close(global.cl_tcp);
    mus_play(global.mus_menu);
    room_goto(rm_menu);
    exit;
}
else
{
    //did connect
    dll39_set_nagle(global.cl_tcp, 1);
    con_add(':: NET: Успешно присоединились к ' + string(ip) + ':' + string(prt));
    
    //send our shit to host
    dll39_buffer_clear(0);
    dll39_write_string(global.pl_name, 0);
    dll39_write_string(global.pl_skin, 0);
    dll39_write_int(global.pl_color, 0);
    dll39_write_byte(global.pl_team, 0);
    dll39_write_string(global.sys_ver, 0);
    dll39_write_string(global.sys_bld, 0);
    dll39_write_string(global.sv_password, 0);
    dll39_message_send(global.cl_tcp, 0, 0, 0);
    con_add(':: NET: Отослана информация о клиенте.');
}

//done



