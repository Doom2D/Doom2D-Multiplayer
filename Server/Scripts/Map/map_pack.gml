//packs the map into a 7z archive
//a0 - map name
if !global.sv_dl_allow {exit;}
if !file_exists('7zs.exe')
{
    con_add(':: MAP: PACK: ERROR: 7z.exe не найден.');
    exit;    
}
if !file_exists('data\maps\' + argument0 + '.dlv')
{
    con_add(':: MAP: PACK: ERROR: Карты ' + argument0 + ' не существует.');
    exit;
}
if file_exists('data\temp\' + argument0 + '.7z')
{
    con_add(':: MAP: PACK: WARNING: Карта '  + argument0 + ' уже запакована.');
    exit;
}

var mapname;
mapname = argument0;

//creates the temp directory
if !directory_exists(working_directory + '\data\temp') {directory_create('data\temp');}

//finds all the files
var sky, mus, tex;
//music
mus =   'data\music\' + file_find_first('data\music\' + mapname + '.*', 0)
file_find_close();
if mus = 'data\music\' {mus = '';}

//sky
sky = 'data\sky\' +  file_find_first('data\sky\' + mapname + '.*', 0)
file_find_close();
if sky = 'data\sky\' {sky = '';}

//texture folder
tex = '';
if directory_exists(working_directory + '\data\textures\' + mapname)
{
    tex = 'data\textures\' + mapname;
}

//launches 7z.exe
execute_program('7zs', ' a -r -y -mx9 temp.7z ' + sky + ' ' + mus + ' ' + tex + ' ' + 'data\maps\' + mapname + '.dlv', true);
sleep(30);

//moves the 7z into the temp folder
if file_exists(working_directory + '\temp.7z')
{
    file_copy('temp.7z', 'data\temp\' + mapname + '.7z');
    file_delete('temp.7z');
    con_add(':: MAP: PACK: Карта запакована в ' + 'data\temp\' + mapname + '.7z');
}
else
{
    con_add(':: MAP: PACK: ERROR: temp.7z не был создан. Возможны ошибки при исполнении 7zs.exe.');
}
