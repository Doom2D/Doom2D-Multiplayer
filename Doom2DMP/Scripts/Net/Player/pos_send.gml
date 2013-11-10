//checks if one of controls is pressed and sends its state
if !variable_global_exists('pl_id') {exit;}
if global.dem_mode >= 2 {exit;}
if global.con || o_con.saymode || instance_exists(o_menu) || !window_get_focus(window_handle())
{
    dyclearbuffer(0);
    dywritebyte(5, 0);
    dywritebyte(0, 0);
    dywritebyte(0, 0);
    dywritebyte(0, 0);
    dywritebyte(0, 0);
    dywritebyte(0, 0);
    dywritebyte(1, 0);
    dysendmessage(global.cl_tcp, 0, 0, 0);
    exit;
}
dyclearbuffer(0);
dywritebyte(5, 0);
dywritebyte(keyboard_check(global.key_left), 0);
dywritebyte(keyboard_check(global.key_right), 0);
dywritebyte(keyboard_check(global.key_jmp), 0);
dywritebyte(keyboard_check(global.key_up), 0);
dywritebyte(keyboard_check(global.key_dn), 0);
dywritebyte(0, 0); //in case we are downloading something
dysendmessage(global.cl_tcp, 0, 0, 0);
