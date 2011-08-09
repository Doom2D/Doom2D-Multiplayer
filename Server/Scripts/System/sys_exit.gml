//stop server
host_exit();

//add to log
if !error_occurred 
{
    con_add(':: SYSTEM: Exiting without error(s).');
}
else
{
    con_add(':: SYSTEM: Exiting with GML error(s). Check game_errors.log.');
}
con_add(':: Date: ' + con_timestamp()) ;
con_add('================SERVER SHUTDOWN================');
game_end();
