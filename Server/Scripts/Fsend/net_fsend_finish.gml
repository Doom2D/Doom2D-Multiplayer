//finishes the file sending process
//a0 - client id
if fsend_state && fsend_file != -1 {dll39_file_close(fsend_file);}

con_add(':: NET: FSEND: Клиенту ' + cl_name + ' отослан файл ' + fsend_path + '.');

fsend_state = 0;
net_fsend_state();

if dll39_buffer_exists(fsend_buf) {dll39_buffer_free(fsend_buf);}
fsend_path = '';
fsend_file = -1;
fsend_pos = 0;
fsend_state = 0;
fsend_size = 0;
fsend_md5 = '';
fsend_cmd5 = '';
fsend_buf = -1;

st_inv = 0;
st_talk = 0;
plr_respawn();
