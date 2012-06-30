//sends a teamchange request
if !variable_global_exists('cl_inst') {exit;}
if !instance_exists(global.cl_inst) {exit;}


if global.mp_gamemode == 0
{
    con_add(':: Вы сейчас не играете в CTF/TDM.');
    exit;
}

if global.cl_inst.cl_team == 1
{
        dll39_buffer_clear(0);
        dll39_write_byte(12, 0);
        dll39_write_byte(global.pl_id, 0);
        dll39_write_byte(2, 0);
        dll39_message_send(global.cl_tcp, 0, 0, 0);
}
if global.cl_inst.cl_team == 2
{
        dll39_buffer_clear(0);
        dll39_write_byte(12, 0);
        dll39_write_byte(global.pl_id, 0);
        dll39_write_byte(1, 0);
        dll39_message_send(global.cl_tcp, 0, 0, 0);
}

