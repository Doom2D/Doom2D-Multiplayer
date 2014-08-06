//packs the map into a 7z archive
//a0 - map name
if !global.sv_dl_allow {exit;}

if !file_exists('7z_sv.exe')
{
  con_add(':: MAP: PACK: ERROR: 7z_sv.exe не найден.');
  exit;    
}

var mapname;
mapname = string(argument0);

if file_exists('data\temp\' + mapname + '.7z')
{
  con_add(':: MAP: PACK: WARNING: Карта '  + mapname + ' уже упакована.');
  exit;
}
if !file_exists('data\maps\' + mapname + '.dlv')
{
  con_add(':: MAP: PACK: ERROR: Карты ' + mapname + ' не существует.');
  exit;
}

con_add(':: MAP: PACK: Упаковка карты ' + mapname + '...');

//creates the temp directory
if !directory_exists('data\temp') {dir_create('data\temp');}

//launches 7z.exe
execute_program('7z_sv.exe',
                'a -r -y -mx9' +
                ' "data\temp\'     + mapname +  '.7z"' +
                ' "data\maps\'     + mapname + '.dlv"' +
                ' "data\music\'    + mapname +   '.*"' +
                ' "data\sky\'      + mapname +   '.*"' +
                ' "data\textures\' + mapname +     '"' +
                iif( global.sv_dl_mapcfg, ' "data\cfg\mapcfg\' + mapname + '.cfg"', '' ),
                true);
sleep(30);

if file_exists('data\temp\' + mapname + '.7z')
  {con_add(':: MAP: PACK: Карта упакована в ' + 'data\temp\' + mapname + '.7z');}
else
  {con_add(':: MAP: PACK: ERROR: Карта не была упакована. Возможно, произошла ошибка при архивации.');}

