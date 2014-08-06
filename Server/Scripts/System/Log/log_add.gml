//adds a string to log
//argument0 - log name
//argument1 - string

var log;
log = file_text_open_append( 'data\logs\' + string(argument0) + '.log' );
file_text_write_string( log, '[' + con_shortstamp() + '] ' + string(argument1) );
file_text_writeln(log);
file_text_close(log);
