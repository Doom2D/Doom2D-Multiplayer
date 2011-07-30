//parses console variables
//argument0 - cvar name
//argument1 - cvar argument
if !variable_global_exists(argument0) {exit;}
if is_real(argument1) || string_letters(argument1) != '' || argument0 == 'sv_ip' || argument0 == 'sv_port' || argument0 == 'sv_port2' {con_add(string(variable_global_get(argument0))); exit;}
if real(argument1) < 0 {con_add(string(variable_global_get(argument0))); exit;}
variable_global_set(string(argument0), real(argument1));
con_cvar_restore();
con_add(argument0 + ' = ' + string(variable_global_get(argument0)));
dll39_buffer_clear(0);
dll39_write_byte(5, 0);
dll39_write_string(':: SERVER: CVAR ' + argument0 + ' теперь равен ' + string(variable_global_get(argument0)), 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0)};
