//checks if sum files exist
con_add(":: SYSTEM: Проверяем наличие необходимых ресурсов...");
if !directory_exists('data')
{
    global.sys_error = true;
    con_add(":: SYSTEM: FATAL ERROR: Папка 'data\' не найдена. Нет ресурсов. Аварийное завершение.");
    sys_exit();
    exit;
}
if !directory_exists('data\gui')
{
    global.sys_error = true;
    con_add(":: SYSTEM: FATAL ERROR: Папка 'data\gui\' не найдена. Аварийное завершение.");
    sys_exit();
    exit;
}
if !directory_exists('data\sounds')
{
    con_add(":: SYSTEM: FATAL ERROR: Папка 'data\sounds\' не найдена. Аварийное завершение.");
    sys_exit();
    exit;
}

if !directory_exists('data\cfg')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\cfg\' не найдена. ");
    directory_create('data\cfg');
}
if !directory_exists('data\maps')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\maps\' не найдена. ");
    directory_create('data\maps');
}
if !directory_exists('data\sky')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\sky\' не найдена. ");
    directory_create('data\sky');
}
if !directory_exists('data\textures')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\textures\' не найдена. ");
    directory_create('data\textures');
}
if !directory_exists('data\music')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\music\' не найдена. ");
    directory_create('data\music');
}
if !directory_exists('data\skins')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\skins\' не найдена. ");
    directory_create('data\skins');
}
if !directory_exists('data\temp')
{
    con_add(":: SYSTEM: WARNING: Папка 'data\temp\' не найдена. ");
    directory_create('data\temp');
}
if !directory_exists('demos')
{
    con_add(":: SYSTEM: WARNING: Папка 'demos\' не найдена. ");
    directory_create('demos');
}
else
{
    if global.sys_cleanup
    {
        con_add(":: SYSTEM: Очистка папки data\temp\...");
        var fn;
        fn = file_find_first("data\temp\*.*", 0);
        while file_exists("data\temp\" + fn)
        {
            file_delete("data\temp\" + fn);
            fn = file_find_next();
        }
        file_find_close();
    }
}

if !file_exists('data\cfg\game.cfg')
{
    con_add(":: SYSTEM: WARNING: Файл 'data\cfg\game.cfg' не найден.");
    f = file_text_open_write('data\cfg\game.cfg');
    file_text_close(f);
}
