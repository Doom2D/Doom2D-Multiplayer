//processing client messages script

//vars
var msg_size, msg_id;

//Check for messages
while(1)
{
    msg_size = dll39_message_receive(cl_tcp, 0, 0); //if no udp then tcp
    if (msg_size <=0) break; //if nothing then break
    msg_id = dll39_read_byte(0); //read message id
    ping = 0;
    //process message
    switch msg_id
    {
        case 2:
            //client disconnected
            var c_id;
            //con_add("DEBUG: Received disconnect message");
            c_id = dll39_read_byte(0);
            if !instance_exists(global.sv_plr[c_id]) {break;}
            
            con_add(":: NET: Клиент " + string(global.sv_plr[c_id].cl_name) + "[" + string(c_id) + "] вышел.");
            with global.sv_plr[c_id] {instance_destroy();}      
            global.sv_plr[c_id] = noone;
            
            //send this to other clients
            dll39_buffer_clear(0);
            dll39_write_byte(4, 0);
            dll39_write_byte(c_id, 0);
            with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
        break;
        
        case 3:
            //chat message
            var msg_str;
            msg_str = dll39_read_string(0);
            
            //send this to other client
            dll39_buffer_clear(0);
            dll39_write_byte(5, 0);
            dll39_write_string(msg_str, 0);
            with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0)};
            
            con_add(msg_str);
        break;
        
        case 4:
            //received ping     
                 
            //send pong back
            dll39_buffer_clear(0);
            dll39_write_byte(6, 0);
            dll39_message_send(cl_tcp, 0, 0, 0);
            
            //inform admin
            //con_add("Received ping message from " + cl_name + ", sent pong.");
        break;
        
        case 5:
            //controls update
            var c_id;
            c_id = dll39_read_byte(0);
            if !instance_exists(global.sv_plr[c_id]) {break;}
            host_message_input(c_id);
        break;
        
        case 6:
            //someone attacks
            var attacker_id;
            attacker_id = dll39_read_byte(0);
            if !instance_exists(global.sv_plr[attacker_id]) {break;}
            with global.sv_plr[attacker_id] {plr_shoot();}
        break;
        
        case 7:
            //weapon change request
            var ch_id, ch_t;
            ch_id = dll39_read_byte(0);
            if !instance_exists(global.sv_plr[ch_id]) {break;}
            ch_t = dll39_read_byte(0);
            with global.sv_plr[ch_id] {plr_changewpn(ch_t);}
        break;

        case 8:
            //rcon request
            var r_cmd, r_pwd;
            if !global.sv_rcon {break;}
            r_cmd = dll39_read_string(0);
            r_pwd = dll39_read_string(0);
            if r_pwd != global.sv_rcon_pwd {break;}
            con_parse(r_cmd);
        break;
        
        case 9:
            //cheat
            var _id, _cht, _inst;
            _cht = 1;
            _id = dll39_read_byte(0);
            _cht = dll39_read_byte(0);
            if _id < 1 || _cht < 1 {break;}
            _inst = id_to_cl(_id);
            if !instance_exists(_inst) {break;}
            switch _cht
            {
                case 1:
                    //godmode
                    if !global.sv_cheats {break;}
                    _inst.st_inv = 1;
                    _inst.hp = 200;
                    _inst.ap = 200;
                break;
                case 2:
                    //flymode
                    if !global.sv_cheats {break;}
                    _inst.st_jet = 1;
                break;
                case 3:
                    //all weapons
                    if !global.sv_cheats {break;}
                    _inst.hw[2] = 1;
                    _inst.hw[3] = 1;
                    _inst.hw[4] = 1;
                    _inst.hw[5] = 1;
                    _inst.hw[6] = 1;
                    _inst.hw[7] = 1;
                    _inst.hw[8] = 1;
                    _inst.hw[9] = 1;
                    _inst.st_bpk = 1;
                    _inst.a1 = 999;
                    _inst.a2 = 999;
                    _inst.a3 = 999;
                    _inst.a4 = 999;
                break;
                case 4:
                    //insta-death
                    _inst.killer_id = _id;
                    _inst.kill_type = 1;
                    _inst.hp = -50;
                break;
            }
        with _inst {plr_send_stat();}
        break;
        
        case 10:
        //color/skin/name change
        _id = dll39_read_byte(0);
        _inst = id_to_cl(_id);
        if !instance_exists(_inst) {break;}
        _inst.cl_name = dll39_read_string(0);
        _inst.cl_skin = dll39_read_string(0);
        if global.mp_gamemode == 0 {_inst.cl_color = dll39_read_int(0);} else {dll39_read_int(0);};
        
        //retranslate
        with _inst {plr_send_skin();}
        break;
        
        case 11:
        //transfer abort
        _id = dll39_read_byte(0);
        _inst = id_to_cl(_id);
        
        if !instance_exists(_inst) {break;}
        if !_inst.fsend_state {break;}
        
        with _inst 
        {
            con_add(':: NET: FSEND: Передача прервана клиентом.');
            file_bin_close(fsend_file);
            fsend_state = 0;
            fsend_path = '';
            fsend_file = -1;
            fsend_pos = 0;
            fsend_state = 0;
            fsend_size = 0;
            st_inv = 0;
            st_talk = 0;
            plr_respawn();
        }
        break;
        
        case 12:
        //team change request
        _id = dll39_read_byte(0);
        _team = dll39_read_byte(0);
        if !instance_exists(id_to_cl(_id)) {break;}
        var red, blu;
        red = team_count(1);
        blu = team_count(2);
        
        if _team == 1 && (red < blu || !global.mp_autobalance)
        {
            with id_to_cl(_id)
            {
                cl_team = 1;
                cl_color = c_red;
                plr_send_team();
                plr_send_skin();
            }
            plr_kill(_id);
            
        }
        if _team == 2 && (red > blu || !global.mp_autobalance)
        {
            with id_to_cl(_id)
            {
                cl_team = 2;
                cl_color = c_blue;
                plr_send_team();
                plr_send_skin();
            }
            plr_kill(_id);
            
        }
        break;
        }
}
