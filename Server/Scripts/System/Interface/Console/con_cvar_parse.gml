//parses console variables
//argument0 - cvar name
//argument1 - cvar argument
if !variable_global_exists(argument0) {exit;}
if is_real(argument1) || string_letters(argument1) != '' || argument0 == 'sv_ip' || (argument0 == 'sv_port' && global.map_w > 0) {con_add(string(variable_global_get(argument0))); exit;}
if real(argument1) < 0 {con_add(string(variable_global_get(argument0))); exit;}
if (argument0 == 'sv_fps_max' || argument0 == 'sv_fps_correct' || argument0 == 'sv_plugins') && global.map_w > 0 {con_add(":: SYSTEM: WARNING: Этот CVAR нельзя менять во время работы сервера."); exit;}

if (argument0 == "mp_gamemode" && global.map_w > 0)
{
  global._mp_nextmode = median(GAME_DM, real(argument1), GAME_CTF);
  con_add("Новый режим будет установлен в следующем раунде.");
  exit;
}

variable_global_set(string(argument0), real(argument1));
con_cvar_restore();
con_add(argument0 + ' = ' + string(variable_global_get(argument0)));
net_say('CVAR ' + string(argument0) + ' теперь равен ' + string(variable_global_get(argument0)), 1);

if global.map_w > 0
{
  if argument0 == 'sv_maxplayers' || argument0 == 'mp_fraglimit' || argument0 == 'mp_scorelimit' || argument0 == 'mp_caplimit' {plr_send_cvars();}
  if argument0 == 'sv_cycle_maps' {map_next();}
  if argument0 == 'mp_timelimit' {alarm[0] = global.mp_timelimit * global.sv_fps_max}
}
