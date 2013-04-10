if global.sv_priority == 0 {exit;}
set_program_priority(global.sv_priority - 4);
con_add(':: SYSTEM: Приоритет процесса изменен: ' + string(global.sv_priority - 4));
