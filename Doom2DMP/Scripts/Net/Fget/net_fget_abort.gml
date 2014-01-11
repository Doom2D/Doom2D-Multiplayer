//use if you want server to abort the transfer
if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}

dll39_write_byte(11, global.send_buf);
dll39_write_byte(global.pl_id, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);

if dll39_buffer_exists(global.fget_buf) {dll39_buffer_free(global.fget_buf);}
if global.fget_file != -1 {dll39_file_close(global.fget_file);}
global.fget_path = '';
global.fget_file = -1;
global.fget_pos = 0;
global.fget_state = 0;
global.fget_size = 0;
global.fget_md5 = '';
