//process messages
var msg_size, msg_id;

while 1
{
    //receive shit
    msg_size = dll39_message_receive(global.cl_tcp, 0, 0);
    if msg_size < 0 break; //got nothing
    
    if global.cl_ping == 1
    {
        global.cl_ping = 0;
        global.cl_last_ping = global.cl_ping_delay/0.06;
        global.cl_ping_delay = 0;
    }
    
    msg_id = dll39_read_byte(0); //got message id
    
    switch msg_id
    {
        case 1:
            //receive mah id and server info
            global.pl_id = dll39_read_byte(0);
            con_add(':: NET: Got accepted in slot ' + string(global.pl_id) + '.');
            global.sv_name = dll39_read_string(0);
            global.sv_map = dll39_read_string(0);
            global.sv_maxplayers = dll39_read_byte(0);
            con_add('Welcome to ' + global.sv_name + ' on ' + global.sv_map + '!');
            map_load(global.sv_map);
            instance_create(0, 0, o_hud);
            alarm[0] = 5;
        break;
        
        case 2:
            //got kicked
            var msg_reason;
            msg_reason = dll39_read_string(0);
            con_add(":: NET: Disconnected - " + msg_reason);
            dll39_socket_close(global.cl_tcp);
            FMODInstanceStop(global._s_cur_mus);
            room_goto(rm_menu);
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
            
            con_add("Player " + string(global.cl_plr[_id].cl_name) + " left.");
            with global.cl_plr[_id] {instance_destroy();}
            global.cl_plr[_id] = -1;
        break;
        
        case 5:
            //chat message
            var _str;
            _str = dll39_read_string(0);
            con_add(_str);
        break;
        
        case 6:
            //received pong
            var _str;
            global.cl_ping = 0;
            _str = string(global.cl_ping_delay / 0.06) + 'ms';
            global.cl_last_ping = global.cl_ping_delay/0.06;
            //con_add("Received pong from server in " + _str + ".");
            
            //reset timer
            global.cl_ping_delay = 0;
        break;
        
        case 7:
            //received position update
            var _id;
            _id = dll39_read_byte(0);
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
            global.cl_plr[_id].kb_strf = dll39_read_byte(0);
            global.cl_plr[_id].x = dll39_read_short(0);
            global.cl_plr[_id].y = dll39_read_short(0);
        break;
        
        case 8:
            //kill message
            var killer_id, victim_id, killer_name, victim_name, kill_type;
            killer_id = dll39_read_byte(0);
            victim_id = dll39_read_byte(0);
            kill_type = dll39_read_byte(0);
            victim_name = 'def_victim';
            killer_name = 'def_killer';
            if !killer_id == 0 {killer_name = global.cl_plr[killer_id].cl_name;}
            victim_name = global.cl_plr[victim_id].cl_name;
            if killer_id == victim_id {con_add(killer_name + " прощается с жестоким миром."); exit;}
            
            switch kill_type
            {
                case 1:
                    con_add(killer_name + " застрелил " + victim_name + " из пистолета.");
                break;
                case 2:
                    con_add(killer_name + " нашпиговал " + victim_name + " ружейной дробью.");
                break;
                case 3:
                    con_add(killer_name + " уложил " + victim_name + " из двустволки.");
                break;
                case 4:
                    con_add(killer_name + " превратил " + victim_name + " в решето.");
                break;
                case 5:
                    con_add(killer_name + " подорвал " + victim_name + ".");
                break;
                case 6:
                    con_add(victim_name + " словил плазменный заряд " + killer_name + ".");
                break;
                case 7:
                    con_add(victim_name + " угодил в зону поражения BFG " + killer_name + ".");
                break;
                case 8:
                    con_add(victim_name + " угодил под шквал дроби из суперпулемета " + killer_name);
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
                    con_add(killer_name + " забил " + victim_name + " до смерти.");
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
            global.cl_plr[_id].hp = dll39_read_byte(0);
            global.cl_plr[_id].ap = dll39_read_byte(0);
            global.cl_plr[_id].a1 = dll39_read_short(0);
            global.cl_plr[_id].a2 = dll39_read_short(0);
            global.cl_plr[_id].a3 = dll39_read_short(0);
            global.cl_plr[_id].a4 = dll39_read_short(0);
            global.cl_plr[_id].w = dll39_read_byte(0);
            global.cl_plr[_id].frag = dll39_read_byte(0);
        break;
        
        case 10:
            //item create
            var _id, it, xx, yy, o;
            _id = dll39_read_short(0);
            _it = dll39_read_byte(0);
            xx = dll39_read_short(0);
            yy = dll39_read_short(0);
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
            spr_attack = dll39_read_byte(0);
            spr_pain = dll39_read_byte(0);
            global.cl_plr[spr_id].attack = spr_attack;
            global.cl_plr[spr_id].pain = spr_pain;
            global.cl_plr[spr_id].alarm[0] = 32;
            global.cl_plr[spr_id].alarm[1] = 16;
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
            r_inter();
            cl_disconnect();
            room_goto(rm_inter);
        break;
    }
}           
