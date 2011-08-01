//stop server
host_exit();

//add to log
con_add(':: Everything looks OK.');
con_add(':: Date: ' + con_timestamp()) ;
con_add('================SERVER SHUTDOWN================');
game_end();
