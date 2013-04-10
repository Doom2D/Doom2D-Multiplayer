//packs the map into a 7z archive
//a0 - map name
if !global.sv_dl_allow {exit;}
if !file_exists('7z_sv.exe')
{
    con_add(':: MAP: PACK: ERROR: 7z_sv.exe не найден.');
    exit;    
}
if !file_exists('data\maps\' + string(argument0) + '.dlv')
{
    con_add(':: MAP: PACK: ERROR: Карты ' + string(argument0) + ' не существует.');
    exit;
}
if file_exists('data\temp\' + string(argument0) + '.7z')
{
    con_add(':: MAP: PACK: WARNING: Карта '  + string(argument0) + ' уже упакована.');
    exit;
}

var mapname, pack, sky, mus, tex;
mapname = string(argument0);

//creates the temp directory
if !directory_exists(working_directory + '\data\temp') {directory_create('data\temp');}

//finds all the files
//music
mus = '"data\music\' + file_find_first('data\music\' + mapname + '.*', 0) + '" '
file_find_close();
if mus = '"data\music\" ' {mus = ' ';}

//sky
sky = '"data\sky\' +  file_find_first('data\sky\' + mapname + '.*', 0) + '" '
file_find_close();
if sky = '"data\sky\" ' {sky = ' ';}

//texture folder
tex = ' ';
if directory_exists(working_directory + '\data\textures\' + mapname) {tex = '"data\textures\' + mapname + '" ';}

pack = '"' + working_directory + '\data\temp\' + mapname + '.7z' + '" ';

//launches 7z.exe
execute_program('7z_sv.exe', ' a -r -y -mx9 ' + pack + sky + mus + tex + '"data\maps\' + mapname + '.dlv"', true);
sleep(30);

if file_exists(working_directory + '\data\temp\' + mapname + '.7z')
  {con_add(':: MAP: PACK: Карта упакована в ' + 'data\temp\' + mapname + '.7z');}
else
  {con_add(':: MAP: PACK: ERROR: Карта не была упакована. Возможно, произошла ошибка при архивации.');}
