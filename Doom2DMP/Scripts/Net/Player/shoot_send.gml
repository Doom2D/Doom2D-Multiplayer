//checks if player tries to shoot or change weapon or use something
if !variable_global_exists('pl_id') {exit;}
if global.dem_mode >= 2 {exit;}

if keyboard_check(global.key_atk) && !global.con && !o_con.saymode
{
    dyclearbuffer(0);
    dywritebyte(6, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
}
if keyboard_check(global.key_use) && !global.con && !o_con.saymode && !uset
{
    dyclearbuffer(0);
    dywritebyte(14, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
    uset = 30;
}
