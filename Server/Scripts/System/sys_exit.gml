//stop server
host_exit();

//add to log
con_add(':: SYSTEM: Exiting without error(s).');
con_add(':: Date: ' + con_timestamp()) ;
con_add('================SERVER SHUTDOWN================');
game_end();
