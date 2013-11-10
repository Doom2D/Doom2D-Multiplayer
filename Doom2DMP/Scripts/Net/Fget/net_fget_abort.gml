//use if you want server to abort the transfer
if global.dem_mode >= 2 {exit;}
if room != rm_game {exit;}
if !variable_global_exists('pl_id') {exit;}

dyclearbuffer(0);
dywritebyte(11, 0);
dywritebyte(global.pl_id, 0);
dysendmessage(global.cl_tcp, 0, 0, 0);

if dybufferexists(global.fget_buf) {dyfreebuffer(global.fget_buf);}
if global.fget_file != -1 {dyfileclose(global.fget_file);}
global.fget_path = '';
global.fget_file = -1;
global.fget_pos = 0;
global.fget_state = 0;
global.fget_size = 0;
global.fget_md5 = '';
