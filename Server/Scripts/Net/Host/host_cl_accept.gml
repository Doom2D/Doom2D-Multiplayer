//dis script accepts clients
//start accepting connections
if global.map_w < 1 {exit;}

var cl_sock;
cl_sock = dll39_tcp_accept(sv_tcp, 1);
if cl_sock < 0 {exit;}

//blocking mode
dll39_set_sync(cl_sock, 0);

//start receiving shit
dll39_message_receive(cl_sock, 0, 0);

//receive temp client info
_name = string_replace(dll39_read_string(0), '#', ' ');
_skin = dll39_read_string(0);
_color = dll39_read_int(0);
//now receive the version info because shit will happen
_cl_ver = dll39_read_string(0);
_cl_bld = dll39_read_string(0);
_cl_pwd = dll39_read_string(0);
_ip = dll39_lastin_ip();

if _name == '' {exit;}

con_add(":: Запрос соединения с IP " + string(_ip) + ". Обработка...");

if !(_cl_ver == global.sys_ver && _cl_bld == global.sys_bld)
{
    //kick the fucker if version mismatch
    dll39_buffer_clear(0);
    dll39_write_byte(2, 0);
    dll39_write_string('В соединении отказано: Версии клиента и сервера не совпадают.', 0);
    dll39_message_send(cl_sock, 0, 0, 0);
    con_add(":: NET: В соединении отказано: Версии клиента и сервера не совпадают.");
    exit;
}

if global.sv_use_pwd && _cl_pwd != global.sv_password
{
    //or password mismatch
    dll39_buffer_clear(0);
    dll39_write_byte(2, 0);
    dll39_write_string('В соединении отказано: Неверный пароль.', 0);
    dll39_message_send(cl_sock, 0, 0, 0);
    con_add(":: NET: В соединении отказано: Неверный пароль.");
    exit;
}

if global.sv_ipbans
{
    //or banlist match :3
    if list_get_ind('ban_list', _ip) >= 0
    {
        dll39_buffer_clear(0);
        dll39_write_byte(2, 0);
        dll39_write_string('В соединении отказано: Вы забанены на этом сервере.', 0);
        dll39_message_send(cl_sock, 0, 0, 0);
        con_add(":: NET: В соединении отказано: Этот IP есть в банлисте.");
        exit;
    }
}

if instance_number(o_pl) == global.sv_maxplayers
{
    //or server is full
    dll39_buffer_clear(0);
    dll39_write_byte(2, 0);
    dll39_write_string('В соединении отказано: Сервер полон.', 0);
    dll39_message_send(cl_sock, 0, 0, 0);
    exit;
}

//find some empty client slot
_id = host_find_slot();

//send server info to the new fucker with his id
dll39_buffer_clear(0);
dll39_write_byte(1, 0);
dll39_write_byte(_id, 0);
dll39_write_string(global.sv_name, 0);
dll39_write_string(global.sv_map, 0);
dll39_write_string(global.map_md5, 0);
dll39_write_byte(global.sv_maxplayers, 0);
dll39_write_string(global.sv_welcome, 0);
dll39_message_send(cl_sock, 0, 0, 0);

//create some new player and give him his ip
_cl = host_add_player(_id, cl_sock, _name, _skin, _color, false);
_cl.cl_ip = _ip;

//send all fuckers' info to the new player
with(o_pl)
{
    dll39_buffer_clear(0);
    dll39_write_byte(3, 0);
    dll39_write_byte(cl_id, 0);
    dll39_write_string(cl_name, 0);
    dll39_write_string(cl_skin, 0);
    dll39_write_int(cl_color, 0);
    dll39_message_send(cl_sock, 0, 0, 0);
    plr_send_pos();
    plr_send_stat();
    plr_send_speed();
}

//and items
with(o_item)
{
    dll39_buffer_clear(0);
    dll39_write_byte(10, 0);
    dll39_write_short(item_id, 0);
    dll39_write_byte(item, 0);
    dll39_write_short(x, 0);
    dll39_write_short(y, 0);
    dll39_message_send(cl_sock, 0, 0, 0);
}


//done.
//set non-blocking mode
dll39_set_sync(cl_sock, 1);

//message
con_add(':: NET: Клиент ' + string(_name) + ' принят в слот ' + string(_cl.cl_id) + '.');

//sound
if global.sv_clalert {sound_play(s_new_client);}

