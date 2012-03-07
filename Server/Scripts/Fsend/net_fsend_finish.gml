//finishes the file sending process
//a0 - client id
file_text_close(fsend_file);

con_add(':: NET: FSEND: Клиенту ' + id_to_cl(argument0).cl_name + ' отослан файл ' + fsend_path + '.');

fsend_state = 0;
net_fsend_state(argument0);

fsend_path = '';
fsend_file = -1;
fsend_pos = 0;
fsend_state = 0;
fsend_size = 0;
fsend_md5 = '';
fsend_cmd5 = '';
