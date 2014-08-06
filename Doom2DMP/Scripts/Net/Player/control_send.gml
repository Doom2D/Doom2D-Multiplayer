//checks if one of controls is pressed and sends its state
if !variable_global_exists('pl_id') {exit;}
if global.fget_state || global.dem_mode >= 2 {exit;}

dll39_write_byte(5, global.send_buf);

if global.con || instance_exists(o_menu) || o_con.saymode || !window_get_focus( window_handle() )
{
  dll39_write_byte(1, global.send_buf); //$b00000001
} else {
  dll39_write_byte( build_byte( keyboard_check(global.key_left),
                                keyboard_check(global.key_right),
                                keyboard_check(global.key_jmp),
                                keyboard_check(global.key_up),
                                keyboard_check(global.key_dn),
                                0, 0, false ), global.send_buf ); //in case we are downloading something
}

tcp_send(global.cl_tcp, global.send_buf);
