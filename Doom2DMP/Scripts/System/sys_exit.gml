//quits game
//free FMOD (if loaded)
if file_exists('GMFMODSimple.dll') {con_add(':: Unloading GMFMOD FMOD...'); FMODfree(); UnloadFMOD();}
//free 39DLL (if loaded)
//exit
con_add(':: Everything looks OK.');
con_add(':: Date: ' + string(current_day) + '.' + string(current_month) + '.' + string(current_year) + ', ' + string(current_hour) + ':' + string(current_minute)) ;
con_add('================GAME END================');
game_end();
