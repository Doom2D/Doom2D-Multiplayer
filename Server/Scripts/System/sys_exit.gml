//argument0 - whether or not to save config
//argument1 - checking call from "restart" console command

//if !variable_global_exists('gui') {exit;}
//if global.gui[0] == -1 {exit;}

//stop server
host_exit();

//write config
if global.sv_autosave && !argument0 {cfg_write('server.cfg');}

//add to log
if !error_occurred { con_add(':: SYSTEM: Ошибок не обнаружено.'); }
else               { con_add(':: SYSTEM: Обнаружена(ы) ошибка(и) GML. См. sv_errors.log.'); }

if !o_host.quiet
{
  API_Free();
  con_add(':: WINAPI: Отключение успешно.');
}
con_add(':: SYSTEM: Дата: ' + con_timestamp());

var sstr;
sstr = 'SHUTDOWN';

//restart shit if necessary
if argument1
{
  var arg;
  arg = '';
  if o_host.quiet == 1 {arg = '-q';}
  if o_host.quiet == 2 {arg = '-nogui';}
  execute_program(parameter_string(0), arg, false);
  sstr = 'RESTART';
}

con_add('====SERVER ' + sstr + '====');
game_end();

