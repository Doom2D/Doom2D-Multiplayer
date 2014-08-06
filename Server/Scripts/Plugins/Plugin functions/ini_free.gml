// closes currently opened ini

if global.sys_ini == '' return false;
if object_index != o_plugin return false;
if !file_exists(global.sys_ini) 
{
    global.sys_ini = ''; 
    global.sys_ini_name = ''; 
    return true;
}

ini_close();

file_copy(global.sys_ini, global.sys_ini_old);
file_delete(global.sys_ini);

global.sys_ini = '';
global.sys_ini_old = '';
return true;
