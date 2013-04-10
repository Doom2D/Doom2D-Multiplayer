//adds a string to log
//argument0 - log name
//argument1 - string
_pth = 'data\logs\' + string(argument0) + '.log';
_log = file_text_open_append(_pth);

var str_add;
str_add = string_replace_all(string(argument1), '#', chr(13) + chr(10));
file_text_write_string(_log, str_add);
file_text_writeln(_log);
file_text_close(_log);
