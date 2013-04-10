if global.dem_mode >= 2 {exit;}
if keyboard_check_pressed(global.key_chw) && !global.con && !o_con.saymode
{
    dyclearbuffer(0);
    dywritebyte(7, 0);
    dywritebyte(1, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
}
if keyboard_check_pressed(global.key_chw2) && !global.con && !o_con.saymode
{
    dyclearbuffer(0);
    dywritebyte(7, 0);
    dywritebyte(2, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
}
