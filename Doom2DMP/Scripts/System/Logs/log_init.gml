//inits a log file

if !directory_exists('data\logs') { dir_create('data\logs'); }
file_text_close( file_text_open_write('data\logs\' + global.sys_log + '.log') );
