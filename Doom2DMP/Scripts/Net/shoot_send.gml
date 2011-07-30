//checks if player tries to shoot or change weapon
if !variable_global_exists('pl_id') {exit;}
if keyboard_check(global.key_atk) && !global.con && !o_con.saymode
{
    dll39_buffer_clear(0);
    dll39_write_byte(6, 0);
    dll39_write_byte(global.pl_id, 0);
    dll39_message_send(global.cl_tcp, 0, 0, 0);
}

