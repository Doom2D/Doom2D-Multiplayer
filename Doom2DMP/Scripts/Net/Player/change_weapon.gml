if global.dem_mode >= 2 || instance_exists(o_menu) || global.con || o_con.saymode {exit;}
if keyboard_check_pressed(global.key_chw)
{
    dyclearbuffer(0);
    dywritebyte(7, 0);
    dywritebyte(1, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
}
if keyboard_check_pressed(global.key_chw2)
{
    dyclearbuffer(0);
    dywritebyte(7, 0);
    dywritebyte(2, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
}
