//unpacks the map
//a0 - map name
if !file_exists('data\temp\' + argument0 + '.7z')
{
    con_add(":: MAP: UNPACK: WARNING: Архив не найден.");
    exit;
}
if !file_exists('7z_cl.exe')
{
    con_add(':: MAP: UNPACK: ERROR: 7z_cl.exe не найден.');
    exit;    
}
var maparc;
con_add(":: MAP: UNPACK: Распаковываем карту " + argument0 + "...");
maparc = '"' + working_directory + '\data\temp\' + argument0 + '.7z"';
execute_program('7z_cl.exe', ' x -y -o"' + working_directory + '" ' + maparc, true);
sleep(30);
con_add(":: MAP: UNPACK: Карта распакована.");
