//quits game
//writes config
cfg_write('game.cfg');
//free FMOD (if loaded)
if file_exists('GMFMODSimple.dll') && file_exists('fmodex.dll') && !global.sys_error {con_add(':: SOUND: Unloading GMFMOD FMOD...'); FMODfree(); UnloadFMOD();}
//free 39DLL (if loaded)
//exit
if global.sys_error {con_add(':: SYSTEM: Exiting with error(s).');} else {con_add(':: SYSTEM: Exiting without error(s).');}
con_add(':: SYSTEM: Date: ' + con_timestamp()) ;
con_add('================GAME END================');
if argument0 == true {game_end();}
