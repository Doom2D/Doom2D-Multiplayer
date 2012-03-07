//use if you want server to abort the transfer
if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}

dll39_buffer_clear(0);
dll39_write_byte(11, 0);
dll39_write_byte(global.pl_id, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);

global.fget_path = '';
global.fget_file = -1;
global.fget_pos = 0;
global.fget_state = 0;
global.fget_size = 0;
global.fget_md5 = '';
