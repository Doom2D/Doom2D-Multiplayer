//inits a log file
if !directory_exists('data')
{
    directory_create('data');
}
if !directory_exists('data\logs')
{
    directory_create('data\logs');
}

_log = file_text_open_write('data\logs\' + global.sys_log + '.log');
file_text_close(_log);
