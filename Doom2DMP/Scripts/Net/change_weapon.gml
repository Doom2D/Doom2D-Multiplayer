if keyboard_check_pressed(global.key_chw) && !global.con
{
    dll39_buffer_clear(0);
    dll39_write_byte(7, 0);
    dll39_write_byte(global.pl_id, 0);
    dll39_message_send(global.cl_tcp, 0, 0, 0);
}
