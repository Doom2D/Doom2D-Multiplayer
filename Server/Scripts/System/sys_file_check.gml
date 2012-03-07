//checks if sum files exist
con_add(":: SYSTEM: Проверка наличия необходимых ресурсов...");
if !directory_exists('data\cfg')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\cfg\' не найдена.");
    directory_create('data\cfg');
}
if !directory_exists('data\maps')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\maps\' не найдена.");
    directory_create('data\maps');
}
if !directory_exists('data\textures')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\textures\'  не найдена.");
    directory_create('data\textures');
}
if !file_exists('data\cfg\server.cfg')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\server.cfg' не найден.");
    f = file_text_open_write('data\cfg\server.cfg');
    file_text_close(f);
}
if !file_exists('data\cfg\autoexec.cfg')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\autoexec.cfg' не найден.");
    f = file_text_open_write('data\cfg\autoexec.cfg');
    file_text_close(f);
}
if !file_exists('data\cfg\map_list.txt')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\map_list.txt' не найден.");
    f = file_text_open_write('data\cfg\map_list.txt');
    file_text_write_string(f, 'dm_superdm');
    file_text_close(f);
}
if !file_exists('data\cfg\bot_names.txt')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\bot_names.txt' не найден.");
    f = file_text_open_write('data\cfg\bot_names.txt');
    file_text_write_string(f, 'DEFAULT');
    file_text_close(f);
}
if !file_exists('data\cfg\bot_skins.txt')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\bot_skins.txt' не найден.");
    f = file_text_open_write('data\cfg\bot_skins.txt');
    file_text_write_string(f, 'DEFAULT');
    file_text_close(f);
}
if !file_exists('data\cfg\bot_chatter.txt')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\bot_chatter.txt' не найден.");
    f = file_text_open_write('data\cfg\bot_chatter.txt');
    file_text_write_string(f, 'DEFAULT');
    file_text_close(f);
}
if !file_exists('data\cfg\ip_bans.txt')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\ip_bans.txt' не найден.");
    f = file_text_open_write('data\cfg\ip_bans.txt');
    file_text_close(f);
}
con_add(":: SYSTEM: Завершено.");
