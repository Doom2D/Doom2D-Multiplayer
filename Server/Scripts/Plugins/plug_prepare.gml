// removes any potentially unwanted shit from the code string

var ___str;
__str = argument0;

if argument1 != 256
{
    __str = string_replace_all(__str, 'plug_dir', 'bar');
    __str = string_replace_all(__str, 'plug_name', 'bar');
    __str = string_replace_all(__str, 'plug_step', 'bar');
    __str = string_replace_all(__str, 'plug_code', 'bar');
}

__str = string_replace_all(__str, 'plug_load_all', 'void');
__str = string_replace_all(__str, 'plug_load_info', 'void');
__str = string_replace_all(__str, 'plug_unload_self', 'void');
__str = string_replace_all(__str, 'plug_unload', 'void');
__str = string_replace_all(__str, 'plug_load', 'void');
__str = string_replace_all(__str, 'plug_prepare', 'void');
__str = string_replace_all(__str, 'plug_exec', 'void');

__str = string_replace_all(__str, 'o_plugin', 'self');

__str = string_replace_all(__str, 'sys_', 'RESTRICTED');

__str = string_replace_all(__str, 'execute_string', 'dostring');
__str = string_replace_all(__str, 'execute_file', 'dofile');

__str = string_replace_all(__str, 'execute_shell', 'void');
__str = string_replace_all(__str, 'execute_program', 'void');

__str = string_replace_all(__str, 'game_end', 'void');
__str = string_replace_all(__str, 'game_restart', 'void');
__str = string_replace_all(__str, 'sleep', 'psleep');

__str = string_replace_all(__str, 'registry_', 'RESTRICTED');
__str = string_replace_all(__str, 'mplay_', 'RESTRICTED');
__str = string_replace_all(__str, 'dll39_', 'RESTRICTED');
__str = string_replace_all(__str, 'file_', 'RESTRICTED');
__str = string_replace_all(__str, 'd3d_', 'RESTRICTED');
__str = string_replace_all(__str, 'draw_', 'RESTRICTED');
__str = string_replace_all(__str, 'window_', 'RESTRICTED');
__str = string_replace_all(__str, 'display_', 'RESTRICTED');
__str = string_replace_all(__str, 'screen_', 'RESTRICTED');
__str = string_replace_all(__str, 'set_automatic_draw', 'void');
__str = string_replace_all(__str, 'set_synchronization', 'void');
__str = string_replace_all(__str, 'set_program_priority', 'void');
__str = string_replace_all(__str, 'keyboard_wait', 'void');

__str = string_replace_all(__str, 'room', 'RESTRICTED');

__str = string_replace_all(__str, 'surface_save_part', 'void');
__str = string_replace_all(__str, 'surface_save', 'void');
__str = string_replace_all(__str, 'sprite_save_strip', 'void');
__str = string_replace_all(__str, 'sprite_save', 'void');
__str = string_replace_all(__str, 'background_save', 'void');

__str = string_replace_all(__str, 'write_msg_id', 'void');

__str = string_replace_all(__str, 'load_file', 'void');

__str = string_replace_all(__str, 'game_save', 'void');
__str = string_replace_all(__str, 'game_load', 'void');

__str = string_replace_all(__str, 'ini_open', 'ini_load');
__str = string_replace_all(__str, 'ini_close', 'ini_free');

return __str;
