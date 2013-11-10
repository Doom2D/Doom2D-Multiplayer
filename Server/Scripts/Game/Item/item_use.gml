//describes item's effect on player
//argument0 - item type
switch argument0
{
    case 1:
        //stimpack
        if hp >= 100 {exit;}
        hp += 10;
        if hp > 100 {hp = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 2:
        //medkit
        if hp >= 100 {exit;}
        hp += 25;
        if hp > 100 {hp = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 3:
        //green armor
        if ap >= 100 {exit;}
        ap += 100;
        if ap > 100 {ap = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 4:
        //blue armor
        if ap >= 200 {exit;}
        ap = 200;
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 5:
        //soulsphere
        if hp >= 200 {exit;}
        hp += 100;
        if hp > 200 {hp = 200;}
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 6:
        //megasphere
        if hp >= 200 && ap >= 200 {exit;}
        hp = 200;
        ap = 200;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 7:
        //invulnerability
        st_inv = 1;
        st_vis = 0;
        st_suit = 0;
        alarm[2] = 0;
        alarm[3] =  30 * global.sv_fps_max;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 8:
        //jetpack
        st_jet = 1;
        alarm[4] =  30 * global.sv_fps_max;
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 10:
        //backpack
        if a1 >= 400 && a2 >= 100 && a3 >= 100 && a4 >= 600 {exit;}
        if a1 < 400 { a1 += 10; if a1 > 400 {a1 = 400;} }
        if a2 < 100 { a2 += 4; if a2 > 100 {a2 = 100;} }
        if a3 < 100 { a3 += 1; if a3 > 100 {a3 = 100;} }
        if a4 < 600 { a4 += 40; if a4 > 600 {a4 = 600;} }
        st_bpk = 1;
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 9:
        //berserk
        if st_ber && hp >= 100 {exit;}
        if hp < 100 {hp = 100;}
        if !st_ber {w = 0;}
        st_ber = 1;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 11:
        //clip
        if a1 >= 200 + 200*st_bpk {exit;}
        a1 += 10;
        if a1 > 200 + 200*st_bpk {a1 = 200 + 200*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 12:
        //box of bullets
        if a1 >= 200 + 200*st_bpk {exit;}
        a1 += 50;
        if a1 > 200 + 200*st_bpk {a1 = 200 + 200*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 13:
        //shells
        if a2 >= 50 + 50*st_bpk {exit;}
        a2 += 4;
        if a2 > 50 + 50*st_bpk {a2 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 14:
        //box of shells
        if a2 >= 50 + 50*st_bpk {exit;}
        a2 += 25;
        if a2 > 50 + 50*st_bpk {a2 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 15:
        //health bonus
        if hp >= 200 {exit;}
        hp += 4;
        if hp > 200 {hp = 200;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 16:
        //armor bonus
        if ap >= 200 {exit;}
        ap += 5;
        if ap > 200 {ap = 200;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 17:
        //rocket
        if a3 >= 50 + 50*st_bpk {exit;}
        a3 += 1;
        if a3 > 50 + 50*st_bpk {a3 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 18:
        //5 rockets
        if a3 >= 50 + 50*st_bpk {exit;}
        a3 += 5;
        if a3 > 50 + 50*st_bpk {a3 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 19:
        //cell
        if a4 >= 300 + 300*st_bpk {exit;}
        a4 += 40;
        if a4 > 300 + 300*st_bpk {a4 = 300 + 300*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 20:
        //super cell
        if a4 >= 300 + 300*st_bpk {exit;}
        a4 += 80;
        if a4 > 300 + 300*st_bpk {a4 = 300 + 300*st_bpk;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 21:
        //shotgun
        if hw[2] && global.mp_weaponstay {exit;}
        if a2 >= 50 + 50*st_bpk && hw[2] == 1 {exit;}
        hw[2] = 1;
        a2 += 4;
        if a2 > 50 + 50*st_bpk {a2 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 22:
        //supershotgun
        if hw[3] && global.mp_weaponstay {exit;}
        if a2 >= 50 + 50*st_bpk && hw[3] == 1 {exit;}
        hw[3] = 1;
        a2 += 4;
        if a2 > 50 + 50*st_bpk {a2 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 23:
        //chaingun
        if hw[4] && global.mp_weaponstay {exit;}
        if a1 >= 200 + 200*st_bpk && hw[4] == 1 {exit;}
        hw[4] = 1;
        a1 += 50;
        if a1 > 200 + 200*st_bpk {a1 = 200 + 200*st_bpk;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 24:
        //chainsaw
        if hw[9] == 1 {exit;}
        hw[9] = 1;
        plr_send_stat();
        plr_send_sound(4, x, y);
        alarm[6] = 1;
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 25:
        //rocketlauncher
        if hw[5] && global.mp_weaponstay {exit;}
        if a3 >= 50 + 50*st_bpk && hw[5] == 1 {exit;}
        hw[5] = 1;
        a3 += 2;
        if a3 > 50 + 50*st_bpk {a3 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 26:
        //plasmagun
        if hw[6] && global.mp_weaponstay {exit;}
        if a4 >= 300 + 300*st_bpk && hw[6] == 1 {exit;}
        hw[6] = 1;
        a4 += 40;
        if a4 > 300 + 300*st_bpk {a4 = 300 + 300*st_bpk;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 27:
        //bfg
        if hw[7] && global.mp_weaponstay {exit;}
        if a4 >= 300 + 300*st_bpk && hw[7] == 1 {exit;}
        hw[7] = 1;
        a4 += 40;
        if a4 > 300 + 300*st_bpk {a4 = 300 + 300*st_bpk;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 28:
        if hw[8] && global.mp_weaponstay {exit;}
        //superchaingun
        if a2 >= 50 + 50*st_bpk && hw[8] == 1 {exit;}
        hw[8] = 1;
        a2 += 25;
        if a2 > 50 + 50*st_bpk {a2 = 50 + 50*st_bpk;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        if !global.mp_weaponstay {with (other) {instance_destroy();}}
    break;
    case 29:
        //red flag
        if global.red_flag == 0
        {
            if cl_team == 1
            {
                if st_flag == 2
                {
                    //capture their flag
                    i = item_find_slot();
                    o = instance_create(global.blu_crd[0], global.blu_crd[1], o_item);
                    o.item_id = i;
                    o.item = 30;
                    global.sv_itm[i] = o;
                    item_send_create(i, o.item, global.blu_crd[0], global.blu_crd[1], true);
                    
                    if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ЗАХВАТИЛ СИНИЙ ФЛАГ!', 3, 2, c_red, 412, 264, 1);}}
                    plr_send_sound(28, x, y);
                    
                    global.team_score[1] += 1;
                    frag += 1;
                    plr_send_score();
                    if global.team_score[1] >= global.mp_caplimit && global.mp_caplimit > 0
                    {
                        o_host.alarm[0] = 1;
                    }
                    
                    st_flag = 0;
                    plr_send_stat();
                    global.blu_flag = 0;
                }
                else {break;}
            }
            else
            {
                //take the flag
                with (other) {instance_destroy();}
                
                st_flag = 1;
                plr_send_stat();
                
                global.red_flag = 1;
                if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' УКРАЛ КРАСНЫЙ ФЛАГ!', 3, 2, c_blue, 412, 264, 1);}}
                plr_send_sound(27, x, y);
            }
        }
        if global.red_flag == 2
        {
            if cl_team == 1
            {
                //return flag to its stand
                i = item_find_slot();
                o = instance_create(global.red_crd[0], global.red_crd[1], o_item);
                o.item_id = i;
                o.item = 29;
                global.sv_itm[i] = o;
                item_send_create(i, o.item, global.red_crd[0], global.red_crd[1], true);
                with (other) {instance_destroy();}
                
                global.red_flag = 0;
                if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ВЕРНУЛ КРАСНЫЙ ФЛАГ!', 3, 2, c_red, 412, 264, 1);}}
            }
            else
            {
                //grab the flag
                with (other) {instance_destroy();}
                
                st_flag = 1;
                plr_send_stat();
                
                global.red_flag = 1;
                if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ПОДОБРАЛ КРАСНЫЙ ФЛАГ!', 3, 2, c_blue, 412, 264, 1);}}
            }
        }
    break;
        
    case 30:
        //blu flag
        if global.blu_flag == 0
        {
            if cl_team == 2
            {
                if st_flag == 1
                {
                    //capture their flag
                    i = item_find_slot();
                    o = instance_create(global.red_crd[0], global.red_crd[1], o_item);
                    o.item_id = i;
                    o.item = 29;
                    global.sv_itm[i] = o;
                    item_send_create(i, o.item, global.red_crd[0], global.red_crd[1], true);
                    
                    if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ЗАХВАТИЛ КРАСНЫЙ ФЛАГ!', 3, 2, c_blue, 412, 264, 1);}}
                    plr_send_sound(28, x, y);
                    
                    global.team_score[2] += 1;
                    frag += 1;
                    plr_send_score();
                    if global.team_score[2] >= global.mp_caplimit && global.mp_caplimit > 0
                    {
                        o_host.alarm[0] = 1;
                    }
                    
                    st_flag = 0;
                    plr_send_stat();
                    global.red_flag = 0;
                }
                else {break;}
            }
            else
            {
                //take the flag
                with (other) {instance_destroy();}
                
                st_flag = 2;
                plr_send_stat();
                
                global.blu_flag = 1;
                if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' УКРАЛ СИНИЙ ФЛАГ!', 3, 2, c_red, 412, 264, 1);}}
                plr_send_sound(27, x, y);
            }
        }
        if global.blu_flag == 2
        {
            if cl_team == 2
            {
                //return flag to its stand
                i = item_find_slot();
                o = instance_create(global.blu_crd[0], global.blu_crd[1], o_item);
                o.item_id = i;
                o.item = 30;
                global.sv_itm[i] = o;
                item_send_create(i, o.item, global.blu_crd[0], global.blu_crd[1], true);
                with (other) {instance_destroy();}
                
                global.blu_flag = 0;
                if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ВЕРНУЛ СИНИЙ ФЛАГ!', 3, 2, c_blue, 412, 264, 1);}}
            }
            else
            {
                //grab the flag
                with (other) {instance_destroy();}
                
                st_flag = 2;
                plr_send_stat();
                
                global.blu_flag = 1;
                if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ПОДОБРАЛ СИНИЙ ФЛАГ!', 3, 2, c_red, 412, 264, 1);}}
            }
        }
    break;
    
    case 31:
        //invisibility
        if st_inv {break;}
        st_vis = 1;
        alarm[2] =  30 * global.sv_fps_max;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    
    case 32:
        //suit
        if st_inv {break;}
        st_suit = 1;
        alarm[7] = 30 * global.sv_fps_max;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
}


