//unpacks the map
//a0 - map name

if !file_exists('7z_cl.exe')
{
  con_add(':: MAP: UNPACK: ERROR: 7z_cl.exe не найден.');
  exit;    
}

var mapname;
mapname = string(argument0);

if !file_exists('data\temp\' + mapname + '.7z')
{
  con_add(':: MAP: UNPACK: WARNING: Архив "data\temp\' + mapname + '.7z" не найден.');
  exit;
}

con_add(":: MAP: UNPACK: Распаковка архива " + mapname + ".7z...");

execute_program('7z_cl.exe',
                'x -y -o"' + working_directory + '" "data\temp\' + mapname + '.7z"',
                true);
sleep(30);

con_add(":: MAP: UNPACK: Архив распакован.");

