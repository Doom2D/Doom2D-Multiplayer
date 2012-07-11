//drops items obtained by dead player
if st_flag == 1 && global.mp_gamemode == 2
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 24, o_item);
    o.item_id = i;
    o.item = 29;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 
    {
        if x < global.map_w && x > 0 && y < global.map_h - 8 && y > 0 && kill_type != 12 {o.alarm[1] = global.mp_drop_clear * 60;} else {o.alarm[1] = 1;}
    }
    item_send_create(i, o.item, x - 32, y - 24);
    
    global.red_flag = 2;
    if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ВЫРОНИЛ КРАСНЫЙ ФЛАГ!', 3, 2, c_blue, 412, 264, 1);}}
    st_flag = 0;
}
if st_flag == 2 && global.mp_gamemode == 2
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 24, o_item);
    o.item_id = i;
    o.item = 30;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 
    {
        if x < global.map_w && x > 0 && y < global.map_h && y > 0 && kill_type != 12 {o.alarm[1] = global.mp_drop_clear * 60;} else {o.alarm[1] = 1;}
    }
    item_send_create(i, o.item, x - 32, y - 24);
    
    global.blu_flag = 2;
    if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ВЫРОНИЛ СИНИЙ ФЛАГ!', 3, 2, c_red, 412, 264, 1);}}
    st_flag = 0;
}

if kill_type == 12 || !global.mp_itemdrop || global.mp_weaponstay {exit;}

if w < 2 {plr_changewpn(1);}

if !global.mp_dropall
{
    switch (w)
    {
        case 2:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 21;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;
        case 3:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 22;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;           
        case 4:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 23;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;            
        case 9:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 24;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;            
        case 5:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 25;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;            
        case 6:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 26;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;            
        case 7:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 27;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;
        case 8:
            i = item_find_slot();
            o = instance_create(x - 32, y - 16, o_item);
            o.item_id = i;
            o.item = 28;
            o.drop = 1;
            global.sv_itm[i] = o;
            if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
            item_send_create(i, o.item, x - 32, y - 16);
        break;
    }
    exit;
}
        
if hw[2]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 21;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if hw[3]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 22;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if hw[4]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 23;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if hw[9]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 24;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if hw[5]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 25;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if hw[6]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 26;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if hw[7]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 27;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if hw[8]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 28;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
if st_bpk
{
    i = item_find_slot();
    o = instance_create(x - 10, y - 16, o_item);
    o.item_id = i;
    o.item = 10;
    o.drop = 1;
    global.sv_itm[i] = o;
    if global.mp_drop_clear > 0 {o.alarm[1] = global.mp_drop_clear * 60;}
    item_send_create(i, o.item, x - 32, y - 16);
}
