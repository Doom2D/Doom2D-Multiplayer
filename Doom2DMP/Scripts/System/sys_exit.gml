//quits game
//writes config
cfg_write('game.cfg');
//free FMOD (if loaded)
if file_exists('GMFMODSimple.dll') && file_exists('fmodex.dll') && !global.sys_error {con_add(':: SOUND: Выгружаем GMFMOD FMOD...'); FMODfree(); UnloadFMOD();}
//free 39DLL (if loaded)
//exit
if global.sys_error {con_add(':: SYSTEM: Обнаружены ошибки.');} else {con_add(':: SYSTEM: Ошибок не обнаружено.');}
con_add(':: SYSTEM: Дата: ' + con_timestamp()) ;
con_add('================GAME END================');
if argument0 == true {game_end();}
