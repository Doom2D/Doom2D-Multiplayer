//stop server
host_exit();

//add to log
con_add(':: Everything looks OK.');
con_add(':: Date: ' + string(current_day) + '.' + string(current_month) + '.' + string(current_year) + ', ' + string(current_hour) + ':' + string(current_minute)) ;
con_add('================SERVER SHUTDOWN================');
game_end();
