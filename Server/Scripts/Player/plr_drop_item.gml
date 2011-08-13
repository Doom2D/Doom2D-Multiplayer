//drops items obtained by dead player
if kill_type == 12 || !global.mp_itemdrop {exit;}

if hw[2]
{
    i = item_find_slot();
    o = instance_create(x - 32, y - 16, o_item);
    o.item_id = i;
    o.item = 21;
    o.drop = 1;
    global.sv_itm[i] = o;
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
    item_send_create(i, o.item, x - 32, y - 16);
}
