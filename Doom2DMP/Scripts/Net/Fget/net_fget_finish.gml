//finishes the file transfer procedure
//a0 - server file size
//a1 - md5
var _err;
_err = 0;

if !global.fget_state 
{
    con_add(':: NET: FGET: Сейчас не получаем никаких файлов.');
    exit;
}

con_add(":: NET: FGET: Приняли файл " + global.fget_path + ".");
con_add(":: NET: FGET: Размер: " + string(file_bin_size(global.fget_file)) + " байт.");
file_bin_close(global.fget_file);
sleep(30);

global.fget_md5 = file_md5(global.fget_path);

con_add(":: NET: FGET: MD5: " + global.fget_md5);

if global.fget_size != argument0 || global.fget_md5 != argument1
{
    con_add(":: NET: FGET: WARNING: Размеры или MD5 не совпадают. Поврежденный файл удален.");
    file_delete(global.fget_path);
    _err = 1;
}

global.map_done = 1;
global.fget_path = '';
global.fget_file = -1;
global.fget_pos = 0;
global.fget_state = 0;
global.fget_size = 0;
global.fget_md5 = '';

//temporary patch to avoid bugs
cl_disconnect();
con_add(':: FGET: Подключитесь заново.');
mus_play(global.mus_menu);
room_goto(rm_set_ip);

return _err;
