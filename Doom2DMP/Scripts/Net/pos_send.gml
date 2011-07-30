//checks if one of controls is pressed and sends its state
if !variable_global_exists('pl_id') {exit;}
if global.con || o_con.saymode 
{
    dll39_buffer_clear(0);
    dll39_write_byte(5, 0);
    dll39_write_byte(global.pl_id, 0);
    dll39_write_byte(0, 0);
    dll39_write_byte(0, 0);
    dll39_write_byte(0, 0);
    dll39_write_byte(0, 0);
    dll39_write_byte(0, 0);
    dll39_write_byte(0, 0);
    dll39_message_send(global.cl_tcp, 0, 0, 0);
    exit;
}
dll39_buffer_clear(0);
dll39_write_byte(5, 0);
dll39_write_byte(global.pl_id, 0);
dll39_write_byte(keyboard_check(global.key_left), 0);
dll39_write_byte(keyboard_check(global.key_right), 0);
dll39_write_byte(keyboard_check(global.key_jmp), 0);
dll39_write_byte(keyboard_check(global.key_up), 0);
dll39_write_byte(keyboard_check(global.key_dn), 0);
dll39_write_byte(keyboard_check(global.key_str), 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);
