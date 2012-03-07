//unpacks the map
//a0 - map name
if !file_exists('data\temp\' + argument0 + '.7z')
{
    con_add(":: MAP: UNPACK: WARNING: Нечего распаковывать.");
    exit;
}
if !file_exists('7zc.exe')
{
    con_add(':: MAP: UNPACK: ERROR: 7zc.exe не найден.');
    exit;    
}
con_add(":: MAP: UNPACK: Распаковываем карту " + argument0 + "...");

file_copy('data\temp\' + argument0 + '.7z', 'temp.7z');
file_delete('data\temp\' + argument0 + '.7z');

execute_program('7zc.exe', ' x -y temp.7z', true);
sleep(30);

con_add(":: MAP: UNPACK: Карта распакована.");
file_delete('temp.7z');
