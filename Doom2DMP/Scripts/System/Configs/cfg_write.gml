//writes current configuration to some config in argument0
if global.sys_error {exit;}
file = 'data\cfg\'+string(argument0);
cfg = file_text_open_write(file);
con_add(':: SYSTEM: Сохранение конфигурации в файл ' + string(file) + '...');
file_text_write_string(cfg, 'name ' + global.pl_name);
file_text_writeln(cfg);
file_text_write_string(cfg, 'color ' + string(color_get_red(global.pl_color)) + ' ' + string(color_get_green(global.pl_color)) + ' ' + string(color_get_blue(global.pl_color)));
file_text_writeln(cfg);
file_text_write_string(cfg, 'skin ' + global.pl_skin);
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_up) + ' +lookup');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_dn) + ' +lookdown');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_left) + ' +left');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_right) + ' +right');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_atk) + ' +attack');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_jmp) + ' +jump');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_chw) + ' +nextweapon');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_chw2) + ' +prevweapon');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_chat) + ' +chat');
file_text_writeln(cfg);
file_text_write_string(cfg, 'bind ' + key_name(global.key_scr) + ' +screenshot');
file_text_writeln(cfg);
file_text_write_string(cfg, 'r_gfx ' + string(global.r_gfx));
file_text_writeln(cfg);
file_text_write_string(cfg, 'r_massacre ' + string(global.r_massacre));
file_text_writeln(cfg);
file_text_write_string(cfg, 'r_names ' + string(global.r_names));
file_text_writeln(cfg);
file_text_write_string(cfg, 'r_window ' + string(1 - window_get_fullscreen()));
file_text_writeln(cfg);
file_text_write_string(cfg, 'r_fskip ' + string(global.r_fskip));
file_text_writeln(cfg);
file_text_write_string(cfg, 's_preload ' + string(global.s_preload));
file_text_writeln(cfg);
file_text_write_string(cfg, 's_vol_sound ' + string(round(FMODGroupGetVolume(2)*100)));
file_text_writeln(cfg);
file_text_write_string(cfg, 's_vol_music ' + string(round(FMODGroupGetVolume(3)*100)));
file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_slist ' + string(global.cl_slist));
file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_slist_path ' + string(global.cl_slist_path));
file_text_writeln(cfg);
file_text_write_string(cfg, 'cls');
file_text_writeln(cfg);
file_text_write_string(cfg, 'echo Добро пожаловать в Doom 2D Multiplayer v0.6!');
con_add(':: SYSTEM: Конфигурация сохранена в файл ' + string(file) + '.');
file_text_close(cfg);
