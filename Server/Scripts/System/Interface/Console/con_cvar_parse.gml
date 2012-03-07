//parses console variables
//argument0 - cvar name
//argument1 - cvar argument
if !variable_global_exists(argument0) {exit;}
if (argument0 == 'sv_fps_max' || argument0 == 'sv_fps_correct') && global.map_w > 0 {con_add(":: SYSTEM: WARNING: Этот CVAR нельзя менять во время работы сервера."); exit;}
if is_real(argument1) || string_letters(argument1) != '' || argument0 == 'sv_ip' || argument0 == 'sv_port' || argument0 == 'sv_port2' {con_add(string(variable_global_get(argument0))); exit;}
if real(argument1) < 0 {con_add(string(variable_global_get(argument0))); exit;}
variable_global_set(string(argument0), real(argument1));
con_cvar_restore();
con_add(argument0 + ' = ' + string(variable_global_get(argument0)));
net_say('CVAR ' + string(argument0) + ' теперь равен ' + string(argument1), 1);
