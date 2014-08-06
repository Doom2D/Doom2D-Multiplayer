//finishes the file transfer procedure

if global.dem_mode >= 2 {exit;}

if !global.fget_state
{
  con_add(':: NET: FGET: В данный момент не принимается никаких файлов.');
  exit;
}

if global.fget_size > global.fget_pos {exit;}

con_add(":: NET: FGET: Скачивание файла завершено.");

var dl_md5;
dl_md5 = dll39_md5_buffer(global.fget_buf);

con_add(":: NET: FGET: MD5 принятых данных: " + dl_md5);

if dl_md5 == global.fget_md5
{
  con_add(":: NET: FGET: Запись файла: " + global.fget_file);
  var file;
  file = dll39_file_open(global.fget_file, dll39_access_write);
  dll39_file_write(file, global.fget_buf);
  dll39_file_close(file);
} else {
  con_add(":: NET: FGET: WARNING: Обнаружена ошибка целостности данных. Скачивание не удалось.");
}

net_fget_clear();
cl_disconnect();
screen_redraw();
sleep(180);
room_restart();
