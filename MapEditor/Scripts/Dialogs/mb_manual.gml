if !file_exists('docs\Editor_Manual.txt')
{
  message_box('Файл "docs\Editor_Manual.txt" не найден.',
              'Ошибка', MB_OK|MB_ICONERROR);
  exit;
}

execute_shell('docs\Editor_Manual.txt', '');
