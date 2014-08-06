//returns MD5-hash of a file
//arg0 - file

var file_nm, data_buf, data_md5;
file_nm = argument0;

if !file_exists(file_nm) { return ''; }

data_buf = load_file(file_nm);
data_md5 = dll39_md5_buffer(data_buf);
dll39_buffer_free(data_buf);

return data_md5;
