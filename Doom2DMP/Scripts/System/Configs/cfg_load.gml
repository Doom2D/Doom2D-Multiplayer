//loads a config
//argument0 - config filename
file = 'data\cfg\' + string(argument0);
if argument0 == '' || argument0 == '0' {file = 'data\cfg\game.cfg';}
if !string_count('.cfg', file) {file += '.cfg';}
if !file_exists(file)
{
  con_add(':: ERROR: Нет такого файла ' + string(file) + '!');
  exit;
}
cfg = file_text_open_read(file);
con_add(':: SYSTEM: Загрузка конфигурации из файла ' + string(file) + '...');
while !file_text_eof(cfg)
{
  cfg_str = file_text_read_string(cfg);
  con_parse(cfg_str);
  file_text_readln(cfg);
}
file_text_close(cfg);
con_add(':: SYSTEM: Загружена конфигурация из файла ' + string(file) + '.');
