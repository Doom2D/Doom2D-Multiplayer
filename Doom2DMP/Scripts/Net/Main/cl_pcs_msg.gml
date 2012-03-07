//process messages
var msg_size, msg_id;

while 1
{
    //receive shit
    msg_size = dll39_message_receive(global.cl_tcp, 0, 0);
    if msg_size < 0 break; //got nothing
    _delay = 0;
    
    msg_id = dll39_read_byte(0); //got message id
    
    switch msg_id
    {
        case 1:
            var _candl;
            //receive mah id and server info
            global.pl_id = dll39_read_byte(0);
            con_add(':: NET: Получен ID: ' + string(global.pl_id) + '.');
            global.sv_name = dll39_read_string(0);
            global.sv_map = dll39_read_string(0);
            global.sv_map_md5 = dll39_read_string(0);
            global.sv_maxplayers = dll39_read_byte(0);
            global.sv_dlallow = dll39_read_byte(0);
            global.cl_fps_max = dll39_read_byte(0);
            _welcome = '';
            _welcome = dll39_read_string(0);
            con_add(':: NET: Получена информация о сервере.');
            
            if !global.sv_dlallow
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
            msg_reason = dll39_read_string(0);
            con_add(":: NET: Вас кикнули: " + msg_reason);
            cl_disconnect();
            if global.map_w > 0
            {
                r_inter(2, 255);
                room_goto(rm_inter);
            }
            else
            {
                mus_play(global.mus_menu);
                room_goto(rm_set_ip);
            }
        break;
        
        case 3:
            //some create new player
            var _name, _skin, _color, _id;
            _id = dll39_read_byte(0);
            _name = dll39_read_string(0);
            _skin = dll39_read_string(0);
            _color = dll39_read_int(0);
            cl_new_plr(_id, _name, _skin, _color);
        break;
        
        case 4:
            //player left
            var _id;
            _id = dll39_read_byte(0);
            if _id < 1 {break;}
            if !instance_exists(global.cl_plr[_id]) {break;}
            con_add('Игрок ' + global.cl_plr[_id].cl_name + ' вышел.');
            if global.cl_plr[_id].object_index != o_client {with global.cl_plr[_id] {instance_destroy();}}
            global.cl_plr[_id] = noone;
        break;
        
        case 5:
            //chat message
            var _str;
            _str = dll39_read_string(0);
            con_add(_str);
            snd_play(24);
        break;
        
        case 6:
            //received pong
            global.cl_ping = round(_timer/0.06);
            _timer = 0;
            //con_add("Received pong from server in " + _str + ".");
        break;
        
        case 7:
            //received position update
            var _id;
            _id = dll39_read_byte(0);
            if !instance_exists(global.cl_plr[_id]) {break;}
            new_left = dll39_read_byte(0);
            new_right = dll39_read_byte(0);
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
            global.cl_plr[_id].kb_jump = dll39_read_byte(0);
            global.cl_plr[_id].kb_lkup = dll39_read_byte(0);
            global.cl_plr[_id].kb_lkdn = dll39_read_byte(0);
            global.cl_plr[_id].st_talk = dll39_read_byte(0);
            global.cl_plr[_id].x = dll39_read_short(0);
            global.cl_plr[_id].y = dll39_read_short(0);
        break;
        
        case 8:
            //kill message
            var killer_id, victim_id, killer_name, victim_name, kill_type;
            killer_id = dll39_read_byte(0);
            victim_id = dll39_read_byte(0);
            if killer_id < 0 || victim_id < 0 {exit;}
            kill_type = dll39_read_byte(0);
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
                    con_add(victim_name + " растворился в кислоте.");
                break;
                case 11:
                    con_add(victim_name + " сгорел в лаве.");
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
            }
        break;
        
        case 9:
            //stats update
            var _id;
            _id = dll39_read_byte(0);
            if !instance_exists(global.cl_plr[_id]) {break;}
            global.cl_plr[_id].hp = dll39_read_byte(0);
            global.cl_plr[_id].ap = dll39_read_byte(0);
            global.cl_plr[_id].a1 = dll39_read_short(0);
            global.cl_plr[_id].a2 = dll39_read_short(0);
            global.cl_plr[_id].a3 = dll39_read_short(0);
            global.cl_plr[_id].a4 = dll39_read_short(0);
            global.cl_plr[_id].w = dll39_read_byte(0);
            global.cl_plr[_id].frag = dll39_read_byte(0);
            global.cl_plr[_id].st_inv = dll39_read_byte(0);
            global.cl_plr[_id].st_ber = dll39_read_byte(0);
            global.cl_plr[_id].alarm[2] = 1;
        break;
        
        case 10:
            //item create
            var _id, it, xx, yy, o, dr;
            _id = dll39_read_short(0);
            _it = dll39_read_byte(0);
            xx = dll39_read_short(0);
            yy = dll39_read_short(0);
            if instance_exists(global.cl_itm[_id]) {exit;}
            o = instance_create(xx, yy, o_item);
            o.item_id = _id;
            o.item = _it;
            global.cl_itm[_id] = o;
            //con_add("Created item");
        break;
        
        case 11:
            //item destroy
            var d_id;
            d_id = dll39_read_short(0);
            if !instance_exists(global.cl_itm[d_id]) {break;}
            with global.cl_itm[d_id] {instance_destroy();}
            global.cl_itm[d_id] = noone;
            //con_add("Destroyed item");
        break;
        
        case 12:
            //particles
            var p_type, p_x, p_y;
            p_type = dll39_read_byte(0);
            p_x = dll39_read_short(0);
            p_y = dll39_read_short(0);
            r_part_emit(p_type, p_x, p_y);
        break;
        
        case 13:
            //sound
            var s_id, s_x, s_y;
            s_id = dll39_read_byte(0);
            s_x = dll39_read_short(0);
            s_y = dll39_read_short(0);
            snd_play_pos(s_id, s_x, s_y);
        break;
        
        case 14:
            //sprite change
            var spr_id, spr_attack, spr_pain;
            spr_id = dll39_read_byte(0);
            if !instance_exists(global.cl_plr[spr_id]) {break;}
            spr_attack = dll39_read_byte(0);
            spr_pain = dll39_read_byte(0);
            global.cl_plr[spr_id].attack = spr_attack;
            global.cl_plr[spr_id].pain = spr_pain;
            global.cl_plr[spr_id].alarm[0] = 32;
            global.cl_plr[spr_id].alarm[1] = 10;
        break;
        
        case 15:
            //an hero appears
            r_corpse(dll39_read_byte(0), dll39_read_short(0), dll39_read_short(0));
        break;
        
        case 16:
            //projectile
            r_projectile(dll39_read_byte(0), dll39_read_byte(0), dll39_read_short(0), dll39_read_short(0), dll39_read_short(0));
        break;
        
        case 17:
            //speed
            var s_id, s_inst;
            s_id = dll39_read_byte(0);
            if !instance_exists(global.cl_plr[s_id]) {break;}
            s_inst = id_to_cl(s_id);
            s_inst.hsp = dll39_read_short(0);
            s_inst.vsp = dll39_read_short(0);
        break;
        
        case 18:
            //explosion
            r_explosion(dll39_read_byte(0), dll39_read_byte(0), dll39_read_short(0), dll39_read_short(0));
        break; 
        
        case 19:
            //game over
            r_inter(dll39_read_byte(0), dll39_read_byte(0));
            cl_disconnect();
            room_goto(rm_inter);
        break;
        
        case 20:
            //char params change
            _id = dll39_read_byte(0);
            _inst = id_to_cl(_id);
            if !instance_exists(_inst) {break;}
            _new_name = dll39_read_string(0);
            _new_skin = dll39_read_string(0);
            _new_color = dll39_read_int(0);
            if _inst.cl_name != _new_name
            {
                con_add(_inst.cl_name + " теперь известен как " + _new_name);
                _inst.cl_name = _new_name;
            }
            if _inst.cl_color != _new_color
            {
                _inst.cl_color = _new_color;
                con_add(string(_new_color));
            }
            if _inst.cl_skin != _new_skin
            {
                _inst.cl_skin = _new_skin;
                with _inst {skin_load(cl_skin);}
                con_add(string(_new_skin));
            }
        break;
        
        case 21:
            //fsend start
            var _state, _file, _size, _md5, _cmd5;
            _state = dll39_read_byte(0);
            _size = dll39_read_int(0);
            _file = dll39_read_string(0);
            _md5 = dll39_read_string(0);
            _cmd5 = dll39_read_string(0);
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
            net_fget_inb(dll39_read_byte(0), dll39_read_int(0));
        break;
        
        default:
            con_add(":: NET: DEBUG: Мусорный пакет (ID " + string(msg_id) + "). Возможно, сервер вылетел.");
            cl_disconnect();
            mus_play(global.mus_menu);
            room_goto(rm_menu);
    }
}           
