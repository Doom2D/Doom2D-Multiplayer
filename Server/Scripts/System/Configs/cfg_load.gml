//loads a config
//argument0 - config filename
file = 'data\cfg\'+string(argument0);
if !file_exists(file)
{
  con_add(':: ERROR: Нет такого файла ' + string('data\cfg\' + string(ds_list_find_value(cmd, 1))) + '!');
  exit;
}
cfg = file_text_open_read(file);
con_add(':: Грузим конфиг ' + string(file) + '...');
while !file_text_eof(cfg)
{
  cfg_str = file_text_read_string(cfg);
  con_parse(cfg_str);
  file_text_readln(cfg);
}
file_text_close(cfg);
con_add(':: Загружен конфиг ' + string(file) + '.');
