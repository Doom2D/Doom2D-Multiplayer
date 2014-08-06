//loads file into 39DLL buffer, returns buffer id
//arg0 - filename

var file_id, buf_id;

buf_id = dll39_buffer_create();
file_id = dll39_file_open(argument0, dll39_access_read);
dll39_file_read(file_id, dll39_file_size(file_id), buf_id);
dll39_file_close(file_id);

return buf_id;
