//dis script accepts clients
//start accepting connections
if global.map_w < 1 {exit;}

var cl_sock;
cl_sock = dytcpaccept(sv_tcp, 1);
if cl_sock < 0 {exit;}

//blocking mode
dysetsync(cl_sock, 0);

//start receiving shit
dyreceivemessage(cl_sock, 0, 0);

//receive temp client info
_name = string_replace(dyreadstring(0), '#', ' ');
_skin = dyreadstring(0);
_color = dyreadint(0);
_team =  dyreadbyte(0);
//now receive the version info because shit will happen
_cl_ver = dyreadstring(0);
_cl_bld = dyreadstring(0);
_cl_pwd = dyreadstring(0);
_ip = dytcpip(cl_sock);

if _name == '' {exit;}

con_add(":: Запрос соединения от " + string(_ip) + ". Обработка...");

if !(_cl_ver == global.sys_ver && _cl_bld == global.sys_bld)
{
    //kick the fucker if version mismatch
    dyclearbuffer(0);
    dywritebyte(2, 0);
    dywritestring('В соединении отказано: Версии клиента и сервера не совпадают.', 0);
    dysendmessage(cl_sock, 0, 0, 0);
    con_add(":: NET: В соединении отказано: Версии клиента и сервера не совпадают.");
    exit;
}

if global.sv_use_pwd && _cl_pwd != global.sv_password
{
    //or password mismatch
    dyclearbuffer(0);
    dywritebyte(2, 0);
    dywritestring('В соединении отказано: Неверный пароль.', 0);
    dysendmessage(cl_sock, 0, 0, 0);
    con_add(":: NET: В соединении отказано: Неверный пароль.");
    exit;
}

if global.sv_ipbans
{
    //or banlist match :3
    if list_get_ind('ban_list', _ip) >= 0
    {
        dyclearbuffer(0);
        dywritebyte(2, 0);
        dywritestring('В соединении отказано: Вы забанены на этом сервере.', 0);
        dysendmessage(cl_sock, 0, 0, 0);
        con_add(":: NET: В соединении отказано: Этот IP есть в банлисте.");
        exit;
    }
}

if instance_number(o_pl) == global.sv_maxplayers
{
    //or server is full
    dyclearbuffer(0);
    dywritebyte(2, 0);
    dywritestring('В соединении отказано: Сервер полон.', 0);
    dysendmessage(cl_sock, 0, 0, 0);
    exit;
}

//find some empty client slot
_id = host_find_slot();

//send server info to the new fucker with his id
dyclearbuffer(0);
dywritebyte(1, 0);
dywritebyte(_id, 0);
dywritestring(global.sv_name, 0);
dywritestring(global.sv_map, 0);
if global.sv_md5check {dywritestring(global.map_md5, 0);} else {dywritestring('-255', 0);}
dywritebyte(global.sv_maxplayers, 0);
if global.mp_gamemode == 0 {dywritebyte(global.mp_fraglimit, 0);} 
if global.mp_gamemode == 1 {dywritebyte(global.mp_scorelimit, 0);}
if global.mp_gamemode == 2 {dywritebyte(global.mp_caplimit, 0);}
dywritebyte(global.mp_gamemode, 0);
dywritebyte(global.sv_dl_allow, 0);
dywritebyte(global.sv_fps_max, 0);
dywritebyte(global.mp_waterfrag, 0);
dywritestring(global.sv_welcome, 0);
dysendmessage(cl_sock, 0, 0, 0);

//create some new player and give him his ip
_cl = host_add_player(_id, cl_sock, _name, _skin, _color, false, plr_select_team(_team));
_cl.cl_ip = _ip;

//send all fuckers' info to the new player
with(o_pl)
{
    dyclearbuffer(0);
    dywritebyte(3, 0);
    dywritebyte(cl_id, 0);
    dywritebyte(cl_team, 0);
    dywritestring(cl_name, 0);
    dywritestring(cl_skin, 0);
    dywriteint(cl_color, 0);
    dysendmessage(cl_sock, 0, 0, 0);
    plr_send_pos();
    plr_send_stat();
    plr_send_speed();
}

//and items
with(o_item)
{
    dyclearbuffer(0);
    dywritebyte(10, 0);
    dywriteshort(item_id, 0);
    dywritebyte(item, 0);
    dywriteshort(x, 0);
    dywriteshort(y, 0);
    dywritebyte(false, 0);
    dysendmessage(cl_sock, 0, 0, 0);
}

//and score
plr_send_score();


//done.
//set non-blocking mode
dysetsync(cl_sock, 1);

//message
con_add(':: NET: Клиент ' + string(_name) + ' принят в слот ' + string(_cl.cl_id) + '.');

//sound
if global.sv_clalert {sound_play(s_new_client);}

//download stuff
if global.sv_dl_allow
{
    if file_exists('data\temp\' + global.sv_map + '.7z')
    {
        with _cl {net_fsend_start(cl_id, 'data\temp\' + global.sv_map + '.7z');}
    }
    else
    {
        with _cl {net_fsend_start(cl_id, 'data\maps\' + global.sv_map + '.dlv');}
    }
}

