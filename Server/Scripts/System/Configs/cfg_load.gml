//loads a config
//argument0 - config filename

var file;
file = 'data\cfg\' + string(argument0);
if argument0 == '' || argument0 == '0' {file = 'data\cfg\server.cfg';}
else if string_lower( filename_ext(file) ) != '.cfg' {file += '.cfg';}

if !file_exists(file)
{
  con_add(':: ERROR: Файл "' + file + '" не найден.');
  exit;
}

var cfg;
cfg = file_text_open_read(file);
con_add(':: SYSTEM: Загрузка конфигурации из файла ' + file + '...');

while !file_text_eof(cfg)
{
  con_parse( file_text_read_string(cfg) );
  file_text_readln(cfg);
}

file_text_close(cfg);
con_add(':: SYSTEM: Загружена конфигурация из файла ' + file + '.');
