//writes current configuration to some config in argument0

if global.sys_error {exit;}

var file, cfg;
file = 'data\cfg\' + string(argument0);
if argument0 == '' || argument0 == '0' {file = 'data\cfg\game.cfg';}
if string_lower( filename_ext(file) ) != '.cfg' {file += '.cfg';}

con_add(':: SYSTEM: Сохранение конфигурации в файл ' + string(file) + '...');
cfg = file_text_open_write(file);

file_text_write_string(cfg, 'name '  + global.pl_name); file_text_writeln(cfg);
file_text_write_string(cfg, 'color ' + string(color_get_red(global.pl_color))   + ' ' +
                                       string(color_get_green(global.pl_color)) + ' ' +
                                       string(color_get_blue(global.pl_color)));               file_text_writeln(cfg);
file_text_write_string(cfg, 'skin '           + global.pl_skin);                               file_text_writeln(cfg);
file_text_write_string(cfg, 'team '           + string(global.pl_team));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_up)     + ' +lookup');     file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_dn)     + ' +lookdown');   file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_left)   + ' +left');       file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_right)  + ' +right');      file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_atk)    + ' +attack');     file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_jmp)    + ' +jump');       file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_use)    + ' +use');        file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_chat)   + ' +chat');       file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_chw)    + ' +nextweapon'); file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_chw2)   + ' +prevweapon'); file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_drop)   + ' +dropflag');   file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_chteam) + ' +changeteam'); file_text_writeln(cfg);
file_text_write_string(cfg, 'bind '           + key_name(global.key_scr)    + ' +screenshot'); file_text_writeln(cfg);
file_text_write_string(cfg, 'r_gfx '          + string(global.r_gfx));                         file_text_writeln(cfg);
file_text_write_string(cfg, 'r_massacre '     + string(global.r_massacre));                    file_text_writeln(cfg);
file_text_write_string(cfg, 'r_flash '        + string(global.r_flash));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'r_names '        + string(global.r_names));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'r_announcer '    + string(global.r_announcer));                   file_text_writeln(cfg);
file_text_write_string(cfg, 'r_window '       + string(!window_get_fullscreen()));             file_text_writeln(cfg);
file_text_write_string(cfg, 'r_width '        + string(global.r_width));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'r_height '       + string(global.r_height));                      file_text_writeln(cfg);
file_text_write_string(cfg, 'r_scale '        + string(global.r_scale));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'r_fskip '        + string(global.r_fskip));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'r_fps_correct '  + string(global.r_fps_correct));                 file_text_writeln(cfg);
file_text_write_string(cfg, 'r_vsync '        + string(global.r_vsync));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'r_depth '        + string(global.r_depth));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'r_drawhud '      + string(global.r_drawhud));                     file_text_writeln(cfg);
file_text_write_string(cfg, 'r_wsplash '      + string(global.r_wsplash));                     file_text_writeln(cfg);
file_text_write_string(cfg, 's_preload '      + string(global.s_preload));                     file_text_writeln(cfg);
file_text_write_string(cfg, 's_vol_sound '    + string(round(FMODGroupGetVolume(2)*100)));     file_text_writeln(cfg);
file_text_write_string(cfg, 's_vol_music '    + string(round(FMODGroupGetVolume(3)*100)));     file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_mastersrv '   + string(global.cl_mastersrv));                  file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_sync_type '   + string(global.cl_sync_type));                  file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_rate '        + string(global.cl_rate));                       file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_interp '      + string(global.cl_interp));                     file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_physics '     + string(global.cl_physics));                    file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_dl_allow '    + string(global.cl_dl_allow));                   file_text_writeln(cfg);
file_text_write_string(cfg, 'cl_dl_override ' + string(global.cl_dl_override));                file_text_writeln(cfg);
if global.dem_will == 'ДА'
{
  file_text_write_string(cfg, 'record'); file_text_writeln(cfg);
}
file_text_write_string(cfg, 'cls'); file_text_writeln(cfg);
file_text_write_string(cfg, 'echo Добро пожаловать в Doom 2D Multiplayer 0.6!');

file_text_close(cfg);
con_add(':: SYSTEM: Конфигурация сохранена в файл ' + string(file) + '.');

