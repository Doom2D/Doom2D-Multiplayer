//quits game
//writes config
cfg_write('game.cfg');
//free FMOD (if loaded)
if file_exists('GMFMODSimple.dll') {con_add(':: SOUND: Unloading GMFMOD FMOD...'); FMODfree(); UnloadFMOD();}
//free 39DLL (if loaded)
//exit
con_add(':: SYSTEM: Everything looks OK.');
con_add(':: Date: ' + con_timestamp()) ;
con_add('================GAME END================');
if argument0 == true {game_end();}
