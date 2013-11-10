//adds a string to log
//argument0 - log name
//argument1 - string
_pth = 'data\logs\' + string(argument0) + '.log';
_log = file_text_open_append(_pth);
file_text_write_string(_log, '[' + con_shortstamp() + '] ' + argument1);
file_text_writeln(_log);
file_text_close(_log);
  
