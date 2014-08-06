//checks if sum files exist

con_add(':: SYSTEM: Проверяем наличие необходимых ресурсов...');

if !directory_exists('data')
{
  global.sys_error = true;
  con_add(':: SYSTEM: FATAL ERROR: Папка "data" не найдена. Нет ресурсов. Аварийное завершение.');
  game_end();
  exit;
}
if !directory_exists('data\gui')
{
  global.sys_error = true;
  con_add(':: SYSTEM: FATAL ERROR: Папка "data\gui" не найдена. Аварийное завершение.');
  game_end();
  exit;
}
if !directory_exists('data\sounds')
{
  global.sys_error = true;
  con_add(':: SYSTEM: FATAL ERROR: Папка "data\sounds" не найдена. Аварийное завершение.');
  game_end();
  exit;
}
if !directory_exists('data\skins\doomer')
{
  global.sys_error = true;
  con_add(':: SYSTEM: FATAL ERROR: Папка "data\skins\doomer" не найдена. Аварийное завершение.');
  game_end();
  exit;
}

if !directory_exists('screenshots')
{
  con_add(':: SYSTEM: WARNING: Папка "screenshots" не найдена.');
  dir_create('screenshots');
}
if !directory_exists('demos')
{
  con_add(':: SYSTEM: WARNING: Папка "demos" не найдена.');
  dir_create('demos');
}

if !directory_exists('data\cfg')
{
  con_add(':: SYSTEM: WARNING: Папка "data\cfg" не найдена.');
  dir_create('data\cfg');
}
if !directory_exists('data\maps')
{
  con_add(':: SYSTEM: WARNING: Папка "data\maps" не найдена.');
  dir_create('data\maps');
}
if !directory_exists('data\music')
{
  con_add(':: SYSTEM: WARNING: Папка "data\music" не найдена.');
  dir_create('data\music');
}
if !directory_exists('data\sky')
{
  con_add(':: SYSTEM: WARNING: Папка "data\sky" не найдена.');
  dir_create('data\sky');
}
if !directory_exists('data\textures')
{
  con_add(':: SYSTEM: WARNING: Папка "data\textures" не найдена.');
  dir_create('data\textures');
}
if !directory_exists('data\temp')
{
  con_add(':: SYSTEM: WARNING: Папка "data\temp" не найдена.');
  dir_create('data\temp');
} else {
  if global.sys_cleanup
  {
    con_add(':: SYSTEM: Очистка папки data\temp\...');
    var fn;
    for ( fn = file_find_first('data\temp\*', 0);
          fn != '';
          fn = file_find_next() )
        { file_delete('data\temp\' + fn); }
    file_find_close();
  }
}

if !file_exists('data\cfg\game.cfg')
{
  con_add(':: SYSTEM: WARNING: Файл "data\cfg\game.cfg" не найден.');
  file_text_close( file_text_open_write('data\cfg\game.cfg') );
}

