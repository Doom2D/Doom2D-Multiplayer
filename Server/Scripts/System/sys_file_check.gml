//checks if sum files exist

con_add(':: SYSTEM: Проверка наличия необходимых ресурсов...');

if !directory_exists('data')
{
  con_add(':: SYSTEM: WARNING: Папка "data" не найдена. Нет ресурсов. Аварийное завершение.');
  sys_exit(true);
  exit;
}
if !directory_exists('data\maps')
{
  con_add(':: SYSTEM: WARNING: Папка "data\maps" не найдена. Нет карт. Аварийное завершение.');
  sys_exit(true);
  exit;
}

if !directory_exists('data\cfg')
{
  con_add(':: SYSTEM: WARNING: Папка "data\cfg" не найдена.');
  dir_create('data\cfg');
}
if !directory_exists('data\plugins')
{
  con_add(':: SYSTEM: WARNING: Папка "data\plugins" не найдена.');
  dir_create('data\plugins');
}

if !file_exists('data\cfg\server.cfg')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\server.cfg" не найден.');
  file_text_close( file_text_open_write('data\cfg\server.cfg') );
}
if !file_exists('data\cfg\autoexec.cfg')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\autoexec.cfg" не найден.');
  file_text_close( file_text_open_write('data\cfg\autoexec.cfg') );
}

if !file_exists('data\cfg\map_list.txt')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\map_list.txt" не найден.');
  file_text_close( file_text_open_write('data\cfg\map_list.txt') );
}
if !file_exists('data\cfg\ip_bans.txt')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\ip_bans.txt" не найден.');
  file_text_close( file_text_open_write('data\cfg\ip_bans.txt') );
}
if !file_exists('data\cfg\blacklist.txt')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\blacklist.txt" не найден.');
  file_text_close( file_text_open_write('data\cfg\blacklist.txt') );
}
if !file_exists('data\cfg\plugins.txt')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\plugins.txt" не найден.');
  file_text_close( file_text_open_write('data\cfg\plugins.txt') );
}
if !file_exists('data\cfg\bot_names.txt')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\bot_names.txt" не найден.');
  file_text_close( file_text_open_write('data\cfg\bot_names.txt') );
}
if !file_exists('data\cfg\bot_skins.txt')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\bot_skins.txt" не найден.');
  file_text_close( file_text_open_write('data\cfg\bot_skins.txt') );
}
if !file_exists('data\cfg\bot_chatter.txt')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\bot_chatter.txt" не найден.');
  file_text_close( file_text_open_write('data\cfg\bot_chatter.txt') );
}

