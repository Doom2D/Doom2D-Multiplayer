//returns MD5-hash of a file
//arg0 - file

var file_nm, file_id, data_buf, data_md5;
file_nm = argument0;

if !file_exists(file_nm) { return ''; }

file_id = dll39_file_open(file_nm, dll39_access_read);
data_buf = dll39_buffer_create();
dll39_file_read(file_id, dll39_file_size(file_id), data_buf);
dll39_file_close(file_id);

data_md5 = dll39_md5_buffer(data_buf);
dll39_buffer_free(data_buf);

return data_md5;

