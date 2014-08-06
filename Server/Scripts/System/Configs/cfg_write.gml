//writes current configuration to some config in argument0
//if a1 is present, does not write map, fps, etc

var file, cfg;
file = 'data\cfg\' + string(argument0);
if argument0 == '' || argument0 == '0'
{
  file = 'data\cfg\server.cfg';
  argument1 = 0;
}
if string_lower( filename_ext(file) ) != '.cfg' {file += '.cfg';}

con_add(':: SYSTEM: Сохранение конфигурации в файл ' + file + '...');
cfg = file_text_open_write(file);

if !argument1
{
  file_text_write_string(cfg, 'sv_map '      + string(global.sv_map));     file_text_writeln(cfg);
  file_text_write_string(cfg, 'sv_name '     + string(global.sv_name));    file_text_writeln(cfg);
  file_text_write_string(cfg, 'sv_port '     + string(global.sv_port));    file_text_writeln(cfg);
  file_text_write_string(cfg, 'sv_welcome '  + string(global.sv_welcome)); file_text_writeln(cfg);
}
file_text_write_string(cfg, 'sv_maxplayers '  + string(global.sv_maxplayers));  file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_clalert '     + string(global.sv_clalert));     file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_use_pwd '     + string(global.sv_use_pwd));     file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_password '    + string(global.sv_password));    file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_lan '         + string(global.sv_lan));         file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_portcheck '   + string(global.sv_portcheck));   file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_rcon '        + string(global.sv_rcon));        file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_rcon_pwd '    + string(global.sv_rcon_pwd));    file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_ipbans '      + string(global.sv_ipbans));      file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_cycle_maps '  + string(global.sv_cycle_maps));  file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_cheats '      + string(global.sv_cheats));      file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_mastersrv '   + string(global.sv_mastersrv));   file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_slist_upd '   + string(global.sv_slist_upd));   file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_sync_type '   + string(global.sv_sync_type));   file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_rate '        + string(global.sv_rate));        file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_voting '      + string(global.sv_voting));      file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_voting_time ' + string(global.sv_voting_time)); file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_fps_max '     + string(global.sv_fps_max));     file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_fps_correct ' + string(global.sv_fps_correct)); file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_dl_allow '    + string(global.sv_dl_allow));    file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_dl_rate '     + string(global.sv_dl_rate));     file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_dl_mapcfg '   + string(global.sv_dl_mapcfg));   file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_md5check '    + string(global.sv_md5check));    file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_autosave '    + string(global.sv_autosave));    file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_log_update '  + string(global.sv_log_update));  file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_autoexec '    + string(global.sv_autoexec));    file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_priority '    + string(global.sv_priority));    file_text_writeln(cfg);
file_text_write_string(cfg, 'sv_plugins '     + string(global.sv_plugins));     file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_rc_time '     + string(global.cl_rc_time));     file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_timeout '     + string(global.cl_timeout));     file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_gamemode '    + string(global.mp_gamemode));    file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_automode '    + string(global.mp_automode));    file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_ffire '       + string(global.mp_ffire));       file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_fraglimit '   + string(global.mp_fraglimit));   file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_scorelimit '  + string(global.mp_scorelimit));  file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_caplimit '    + string(global.mp_caplimit));    file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_timelimit '   + string(global.mp_timelimit));   file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_respawn '     + string(global.mp_respawn));     file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_respawn_inv ' + string(global.mp_respawn_inv)); file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_itemrespawn ' + string(global.mp_itemrespawn)); file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_items '       + string(global.mp_items));       file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_powerups '    + string(global.mp_powerups));    file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_knockback '   + string(global.mp_knockback));   file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_selfdamage '  + string(global.mp_selfdamage));  file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_aimtype '     + string(global.mp_aimtype));     file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_itemdrop '    + string(global.mp_itemdrop));    file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_weaponstay '  + string(global.mp_weaponstay));  file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_penalty '     + string(global.mp_penalty));     file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_autobalance ' + string(global.mp_autobalance)); file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_announcer '   + string(global.mp_announcer));   file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_drop_clear '  + string(global.mp_drop_clear));  file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_shootjthr '   + string(global.mp_shootjthr));   file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_telefrag '    + string(global.mp_telefrag));    file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_waterfrag '   + string(global.mp_waterfrag));   file_text_writeln(cfg);
file_text_write_string(cfg, 'mp_waterbfgdmg ' + string(global.mp_waterbfgdmg)); file_text_writeln(cfg);
file_text_write_string(cfg, 'bot_names '      + string(global.bot_names));      file_text_writeln(cfg);
file_text_write_string(cfg, 'bot_chatter '    + string(global.bot_chatter));    file_text_writeln(cfg);
file_text_write_string(cfg, 'bot_randrate '   + string(global.bot_randrate));   file_text_writeln(cfg);
file_text_write_string(cfg, 'bot_userate '    + string(global.bot_userate));    file_text_writeln(cfg);
file_text_write_string(cfg, 'bot_cowardly '   + string(global.bot_cowardly));

file_text_close(cfg);
con_add(':: SYSTEM: Конфигурация сохранена в файл ' + file + '.');

