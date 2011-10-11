if keyboard_check_pressed(global.key_chw) && !global.con && !o_con.saymode
{
    dll39_buffer_clear(0);
    dll39_write_byte(7, 0);
    dll39_write_byte(global.pl_id, 0);
    dll39_write_byte(1, 0);
    dll39_message_send(global.cl_tcp, 0, 0, 0);
}
if keyboard_check_pressed(global.key_chw2) && !global.con && !o_con.saymode
{
    dll39_buffer_clear(0);
    dll39_write_byte(7, 0);
    dll39_write_byte(global.pl_id, 0);
    dll39_write_byte(2, 0);
    dll39_message_send(global.cl_tcp, 0, 0, 0);
}
