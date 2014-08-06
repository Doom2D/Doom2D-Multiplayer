// opens inis stored in plugin folder
// argument0 - filename

if object_index != o_plugin return false;
if global.sys_ini != '' return false;

var _fn, _f, _str;
_fn = 'data\plugins\' + plug_dir + '\' + string(argument0);
_str = '';

if !file_exists(_fn) return false;
if string_lower(filename_ext(_fn)) != '.ini' return false;

file_copy(_fn, string(argument0));

global.sys_ini = argument0;
global.sys_ini_old = _fn;

return true;
