//process messages
var msg_size, msg_id;

while 1
{
    //receive shit
    if global.dem_mode == 3 {break; exit;}
    if global.dem_mode < 2 {msg_size = dyreceivemessage(global.cl_tcp, 0, 0);} else {msg_size = 0;}
    if msg_size < 0 break; //got nothing
    
    _delay = 0;
    
    if global.dem_mode == 2
    {
        if _dem_time || global.dem_pause {break;}
        demo_tic();
    }
    
    msg_id = dyreadbyte(0); //got message id
    
    if global.dem_mode == 1 && msg_id > 0 && msg_id != 21 && msg_id != 22 && msg_id != 23
    {
        dysetpos(0, 0);
        dyclearbuffer(global.dem_b);
        dywriteushort(_dem_delay, global.dem_b);
        dywriteushort(msg_size, global.dem_b);
        dyfilewrite(global.dem_f, global.dem_b);
        dyfilewrite(global.dem_f, 0);
        dysetpos(1, 0);
        _dem_delay = 0;
    }
    
    switch msg_id
    {
        case 1:
            if global.map_w {break;}    
        
            var _candl;
            //receive mah id and server info
            global.pl_id = dyreadbyte(0);
            con_add(':: NET: Получен ID: ' + string(global.pl_id) + '.');
            global.sv_name = dyreadstring(0);
            global.sv_map = dyreadstring(0);
            global.sv_map_md5 = dyreadstring(0);
            global.sv_maxplayers = dyreadbyte(0);
            global.mp_fraglimit = dyreadbyte(0);
            global.mp_gamemode = dyreadbyte(0);
            global.sv_dlallow = dyreadbyte(0);
            global.cl_fps_max = dyreadbyte(0);
            global.mp_waterfrag = dyreadbyte(0);
            _welcome = '';
            _welcome = dyreadstring(0);
            con_add(':: NET: Получена информация о сервере.');
            
            if !global.sv_dlallow || global.dem_mode == 2
            {
                event_user(0);
            }
            else
            {
                global.map_done = 0;
            }
            
            room_speed = global.cl_fps_max;
            alarm[0] = 5;
        break;
        
        case 2:
            //got kicked
            var msg_reason;
            msg_reason = dyreadstring(0);
            con_add(":: NET: Вас кикнули: " + msg_reason);
            cl_disconnect();
            if global.map_w > 0 && global.dem_mode < 2
            {
                r_inter(2, 255);
                room_goto(rm_inter);
            }
            else
            {
                mus_play(global.mus_menu);
                demo_finish();
                room_goto(rm_menu);
            }
        break;
        
        case 3:
            //some create new player
            var _name, _skin, _color, _id, _team;
            _id = dyreadbyte(0);
            _team = dyreadbyte(0);
            _name = dyreadstring(0);
            _skin = dyreadstring(0);
            _color = dyreadint(0);
            cl_new_plr(_id, _name, _skin, _color, _team);
            if instance_exists(o_hud)
            {
                with o_hud if !alarm[0] net_list_clients();
            }
        break;
        
        case 4:
            //player left
            var _id;
            _id = dyreadbyte(0);
            if _id < 1 {break;}
            if !instance_exists(global.cl_plr[_id]) {break;}
            con_add('Игрок ' + global.cl_plr[_id].cl_name + ' вышел.');
            if global.cl_plr[_id].object_index != o_client {with global.cl_plr[_id] {instance_destroy();}}
            global.cl_plr[_id] = noone;
            if instance_exists(o_hud)
            {
                with o_hud if !alarm[0] net_list_clients();
            }
        break;
        
        case 5:
            //chat message
            var _str;
            _str = dyreadstring(0);
            con_add(_str);
            snd_play(24);
        break;
        
        case 6:
            //received pong
            global.cl_ping = round(_timer/0.06);
            _timer = 0;
            if global.dem_mode == 2 {global.cl_ping = 0;}
            //con_add("Received pong from server in " + _str + ".");
        break;
        
        case 7:
            //received position update
            var _id;
            _id = dyreadbyte(0);
            if !instance_exists(global.cl_plr[_id]) {break;}
            new_left = dyreadbyte(0);
            new_right = dyreadbyte(0);
            if new_left == 1 && new_right == 1
            {
                if global.cl_plr[_id].hsp > 0
                {
                    global.cl_plr[_id].image_xscale = -1;
                    new_left = 0;
                }
                if global.cl_plr[_id].hsp < -0
                {
                    global.cl_plr[_id].image_xscale = 1;
                    new_right = 0;
                }
            }
            else
            {
                if new_left == 1 {global.cl_plr[_id].image_xscale = -1;}
                if new_right == 1 {global.cl_plr[_id].image_xscale = 1;}
            }
            global.cl_plr[_id].kb_left = new_left;
            global.cl_plr[_id].kb_rght = new_right;
            global.cl_plr[_id].kb_jump = dyreadbyte(0);
            global.cl_plr[_id].kb_lkup = dyreadbyte(0);
            global.cl_plr[_id].kb_lkdn = dyreadbyte(0);
            global.cl_plr[_id].st_talk = dyreadbyte(0);
            if global.cl_interp
            {
                global.cl_plr[_id].xto = dyreadshort(0);
                global.cl_plr[_id].yto = dyreadshort(0);
                with global.cl_plr[_id] {if abs(x - xto) > 128 || abs(y - yto) > 128 {x = xto; y = yto;}}
            }
            else
            {
                global.cl_plr[_id].x = dyreadshort(0);
                global.cl_plr[_id].y = dyreadshort(0);
                global.cl_plr[_id].xto = 99999;
                global.cl_plr[_id].yto = 99999;
            }
        break;
        
        case 8:
            //kill message
            var killer_id, victim_id, killer_name, victim_name, kill_type;
            killer_id = dyreadbyte(0);
            victim_id = dyreadbyte(0);
            if killer_id < 0 || victim_id < 0 {exit;}
            kill_type = dyreadbyte(0);
            victim_name = 'def_victim';
            killer_name = 'def_killer';
            if killer_id > 0 && !instance_exists(global.cl_plr[killer_id]) {break;}
            if !instance_exists(global.cl_plr[victim_id]) {break;}
            if killer_id != 0 {killer_name = global.cl_plr[killer_id].cl_name;}
            victim_name = global.cl_plr[victim_id].cl_name;
            if killer_id == victim_id {con_add(killer_name + " прощается с жестоким миром."); break;}
            
            switch kill_type
            {
                case 1:
                    con_add(killer_name + " угостил " + victim_name + " пистолетной пулей.");
                break;
                case 2:
                    con_add(killer_name + " застрелил " + victim_name + " из ружья.");
                break;
                case 3:
                    con_add(killer_name + " разорвал " + victim_name + " выстрелом из двустволки.");
                break;
                case 4:
                    con_add(killer_name + " превратил " + victim_name + " в дуршлаг.");
                break;
                case 5:
                    con_add(killer_name + " взорвал " + victim_name + ".");
                break;
                case 6:
                    con_add(killer_name + " прожег плазмой дырку в " + victim_name + ".");
                break;
                case 7:
                    con_add(killer_name + " познакомил " + victim_name + " с зарядом BFG.");
                break;
                case 8:
                    con_add(victim_name + " был превращен в фарш суперпулеметом " + killer_name);
                break;
                case 9:
                    con_add(victim_name + " утонул.");
                break;
                case 10:
                case 11:
                    con_add(victim_name + " растворился в кислоте.");
                break;
                case 12:
                    con_add(victim_name + " выпал.");
                break;
                case 13:
                    con_add(killer_name + " сломал челюсть " + victim_name + ".");
                break;
                case 14:
                    con_add(killer_name + " распилил " + victim_name + ".");
                break;
                default:
                    con_add(victim_name + " умер.");
                break;
            }
            if instance_exists(o_hud)
            {
                with o_hud if !alarm[0] net_list_clients();
            }
        break;
        
        case 9:
            //stats update
            var _id, _oh;
            _oh = 0;
            _id = dyreadbyte(0);
            if !instance_exists(global.cl_plr[_id]) {break;}
            if _id = global.pl_id {_oh = global.cl_plr[_id].hp;}
            global.cl_plr[_id].hp = dyreadbyte(0);
            global.cl_plr[_id].ap = dyreadbyte(0);
            global.cl_plr[_id].a1 = dyreadshort(0);
            global.cl_plr[_id].a2 = dyreadshort(0);
            global.cl_plr[_id].a3 = dyreadshort(0);
            global.cl_plr[_id].a4 = dyreadshort(0);
            global.cl_plr[_id].w = dyreadbyte(0);
            global.cl_plr[_id].frag = dyreadbyte(0);
            global.cl_plr[_id].st_inv = dyreadbyte(0);
            global.cl_plr[_id].st_ber = dyreadbyte(0);
            global.cl_plr[_id].st_flag = dyreadbyte(0);
            global.cl_plr[_id].st_vis = dyreadbyte(0);
            global.cl_plr[_id].alarm[2] = 1;
            
            //pain splash
            if !instance_exists(o_hud) {break;}
            if _id == o_hud.viewing && _oh > 10 {o_hud.pain_alpha += max(0, (_oh - global.cl_inst.hp)/100);}
            with o_hud if !alarm[0] net_list_clients();
        break;
        
        case 10:
            //item create
            var _id, it, xx, yy, anm, o;
            _id = dyreadshort(0);
            _it = dyreadbyte(0);
            xx = dyreadshort(0);
            yy = dyreadshort(0);
            anm = dyreadbyte(0);
            if instance_exists(global.cl_itm[_id]) {exit;}
            o = instance_create(xx, yy, o_item);
            o.item_id = _id;
            o.item = _it;
            o.anim_st = anm;
            global.cl_itm[_id] = o;
            //con_add("Created item");
        break;
        
        case 11:
            //item destroy
            var d_id;
            d_id = dyreadshort(0);
            if !instance_exists(global.cl_itm[d_id]) {break;}
            with global.cl_itm[d_id] {instance_destroy();}
            global.cl_itm[d_id] = noone;
            //con_add("Destroyed item");
        break;
        
        case 12:
            //particles
            var p_type, p_x, p_y;
            p_type = dyreadbyte(0);
            p_x = dyreadshort(0);
            p_y = dyreadshort(0);
            r_part_emit(p_type, p_x, p_y);
        break;
        
        case 13:
            //sound
            var s_id, s_x, s_y;
            s_id = dyreadbyte(0);
            s_x = dyreadshort(0);
            s_y = dyreadshort(0);
            snd_play_pos(s_id, s_x, s_y);
        break;
        
        case 14:
            //sprite change
            var spr_id, spr_attack, spr_pain;
            spr_id = dyreadbyte(0);
            if !instance_exists(global.cl_plr[spr_id]) {break;}
            spr_attack = dyreadbyte(0);
            spr_pain = dyreadbyte(0);
            global.cl_plr[spr_id].attack = spr_attack;
            global.cl_plr[spr_id].pain = spr_pain;
            global.cl_plr[spr_id].alarm[0] = 32;
            global.cl_plr[spr_id].alarm[1] = 10;
            if spr_pain == 1 {global.cl_plr[spr_id].dname = true; global.cl_plr[spr_id].alarm[3] = 60;}
        break;
        
        case 15:
            //an hero appears
            r_corpse(dyreadbyte(0), dyreadshort(0), dyreadshort(0));
        break;
        
        case 16:
            //projectile
            r_projectile(dyreadbyte(0), dyreadbyte(0), dyreadshort(0), dyreadshort(0), dyreadshort(0));
        break;
        
        case 17:
            //speed
            var s_id, s_inst;
            s_id = dyreadbyte(0);
            if !instance_exists(global.cl_plr[s_id]) {break;}
            s_inst = id_to_cl(s_id);
            s_inst.hsp = dyreadshort(0);
            s_inst.vsp = dyreadshort(0);
        break;
        
        case 18:
            //explosion
            r_explosion(dyreadbyte(0), dyreadbyte(0), dyreadshort(0), dyreadshort(0));
        break; 
        
        case 19:
            //game over
            if global.dem_mode >= 2 {break;}
            r_inter(dyreadbyte(0), dyreadbyte(0));
            cl_disconnect();
            room_goto(rm_inter);
        break;
        
        case 20:
            //char params change
            _id = dyreadbyte(0);
            _inst = id_to_cl(_id);
            if !instance_exists(_inst) {break;}
            _new_name = dyreadstring(0);
            _new_skin = dyreadstring(0);
            _new_color = dyreadint(0);
            if _inst.cl_name != _new_name
            {
                con_add(_inst.cl_name + " теперь известен как " + _new_name);
                _inst.cl_name = _new_name;
            }
            if _inst.cl_color != _new_color
            {
                _inst.cl_color = _new_color;
            }
            if _inst.cl_skin != _new_skin
            {
                _inst.cl_skin = _new_skin;
                with _inst {skin_load(cl_skin);}
            }
            if instance_exists(o_hud)
            {
                with o_hud if !alarm[0] net_list_clients();
            }
        break;
        
        case 21:
            //fsend state
            var _state, _file, _size, _md5, _cmd5;
            _state = dyreadbyte(0);
            _size = dyreadint(0);
            _file = dyreadstring(0);
            _md5 = dyreadstring(0);
            _cmd5 = dyreadstring(0);
            if _state && !global.fget_state
            {
                net_fget_main(_file, _size, _md5, _cmd5);
            }
            if !_state && global.fget_state
            {
                net_fget_finish(_size, _md5);
                
                if global.sv_dlallow && !global.map_done
                {
                    with (o_client) {event_user(0);}
                }
            }
        break;
        
        case 22:
            //fsend inbyte
            net_fget_inb(dyreadbyte(0), dyreadint(0));
        break;
        
        case 23:
            //hud text
            if global.dem_mode >= 2 {break;}
            var n, ns, nt, nf, nc, nx, ny, ns;
            n = 1;
            ns = dyreadstring(0); //text
            nt = dyreaddouble(0) * global.cl_fps_max; //timer
            nf = dyreadbyte(0); //font
            nc = dyreadint(0);
            nx = dyreaddouble(0); //offset x
            ny = dyreaddouble(0); //offset y
            n = dyreadbyte(0);
            for (i = 1; i <= 4; i += 1)
            {
                if global.hud_text[i, 1] == '' && n == 0
                {
                    n = i;
                    break;
                }
            }
            global.hud_text[n, 1] = ns; //text
            global.hud_text[n, 2] = nt; //timer
            f = nf; //font
            global.hud_text[n, 6] = nc;
            global.hud_text[n, 4] = nx; //offset x
            global.hud_text[n, 5] = ny; //offset y
            switch f
            {
                case 1: global.hud_text[n, 3] = global.fnt_sys; break;
                case 2: global.hud_text[n, 3] = global.fnt_small; break;
                case 3: global.hud_text[n, 3] = global.fnt_big; break;
            }
        break;
        
        case 24:
            //team change
            _id = dyreadbyte(0);
            _inst = id_to_cl(_id);
            if !instance_exists(_inst) {break;}
            _team = dyreadbyte(0);
            if _team == 1
            {
                con_add(":: Игрок " + string(_inst.cl_name) + " перешел в красную команду.");
            }
            else
            {
                con_add(":: Игрок " + string(_inst.cl_name) + " перешел в синюю команду.");
            }
            _inst.cl_team = _team;
            if instance_exists(o_hud)
            {
                with o_hud if !alarm[0] net_list_clients();
            }
        break;
        
        case 25:
            //team score
            global.team_score[1] = dyreadbyte(0);
            global.team_score[2] = dyreadbyte(0);
            if instance_exists(o_hud)
            {
                with o_hud if !alarm[0] net_list_clients();
            }
        break;
        
        case 26:
            //tile change
            var tile, state, tinst;
            tile = dyreadushort(0);
            state = dyreadbyte(0);
            
            tinst = ds_list_find_value(global.cl_tiles, tile);
            if !instance_exists(tinst) {break;}

            if state
            {
                with tinst
                {
                    visible = true;
                    x = xstart;
                    y = ystart;
                }
            }
            else
            {
                with tinst
                {
                    visible = false;
                    x = -2048;
                    y = -2048;
                }
            }
        break;
        
        case 27:
            //server shit change
            global.sv_name = dyreadstring(0);
            global.sv_maxplayers = dyreadbyte(0);
            global.mp_fraglimit = dyreadbyte(0);
            global.mp_waterfrag = dyreadbyte(0);
        break;
        
        default:
            con_add(":: NET: DEBUG: Принят пакет с неизвестным ID (" + string(msg_id) + ").");
            global.debug_counter += 1;
            alarm[11] = 30 * 60;
            if global.debug_counter > 15 && global.dem_mode < 2
            {
                con_add(":: NET: DEBUG: Слишком много неопознанных пакетов. Возможно, сервер вылетел.");
                cl_disconnect();
                mus_play(global.mus_menu);
                room_goto(rm_menu);
            }
    }
}           
