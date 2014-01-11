//finishes the file transfer procedure
//a0 - server file size
//a1 - md5

if global.dem_mode >= 2 {exit;}

var _err;
_err = 0;

if !global.fget_state
{
    con_add(':: NET: FGET: В данный момент не принимается никаких файлов.');
    exit;
}

con_add(":: NET: FGET: Принят файл " + global.fget_path + ".");
con_add(":: NET: FGET: Размер: " + string(dll39_file_size(global.fget_file)) + " байт.");
dll39_file_close(global.fget_file);
sleep(30);

global.fget_md5 = file_md5(global.fget_path);

con_add(":: NET: FGET: MD5: " + global.fget_md5);

if global.fget_size != argument0 || global.fget_md5 != argument1
{
    con_add(":: NET: FGET: WARNING: Размеры или MD5 не совпадают. Поврежденный файл удален.");
    file_delete(global.fget_path);
    _err = 1;
}

if dll39_buffer_exists(global.fget_buf) {dll39_buffer_free(global.fget_buf);}
global.map_done = 1;
global.fget_path = '';
global.fget_file = -1;
global.fget_buf = -1;
global.fget_size = 0;
global.fget_md5 = '';
global.fget_pos = 0;

//temporary patch to avoid bugs
cl_disconnect();
screen_redraw();
sleep(180);
global.fget_state = 0;
room_restart();

return _err;
