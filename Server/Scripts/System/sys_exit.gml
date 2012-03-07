//argument0 - whether or not to save config
if !variable_global_exists('gui') {exit;}
if global.gui[0] == -1 {exit;}

//stop server
host_exit();

//write config
if !argument0 {cfg_write('server.cfg');}

//add to log
if !error_occurred 
{
    con_add(':: SYSTEM: Ошибок не обнаружено.');
}
else
{
    con_add(':: SYSTEM: Обнаружена(ы) ошибка(и) GML. См. game_errors.log.');
}
if !quiet {con_add(':: WINAPI: Отключение успешно.');}
con_add(':: SYSTEM: Дата: ' + con_timestamp()) ;
con_add('====SERVER SHUTDOWN====');
if !quiet {API_Free();}
game_end();
