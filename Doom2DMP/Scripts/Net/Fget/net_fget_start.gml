//starts file download process
//arg0 - filename
//arg1 - size
//arg2 - file md5
//arg3 - md5 of archive contents

if global.dem_mode >= 2 {exit;}

var f_pt, f_nm, f_sz, f_cs, d_cs;
f_pt = string(argument0);
f_nm = filename_name(f_pt);
f_sz = argument1;
f_cs = argument2;
d_cs = argument3;

con_add(":: NET: FGET: Сервер пытается прислать файл " + f_nm + "...");

if !global.cl_dl_allow
{
  con_add(':: NET: FGET: Прием файлов отключен. Передача прервана.');
  net_fget_abort(true);
  exit;
}

if d_cs != ''
{
  con_add(':: NET: FGET: ' + f_nm + ' - архив.');
  if !net_fget_check('data\maps\' + filename_change_ext(f_nm, '.dlv'), d_cs) {exit;}
}

if !net_fget_check(f_pt, f_cs) {exit;}

global.fget_state = true;
global.fget_file = f_pt;
global.fget_buf = dll39_buffer_create();
global.fget_size = f_sz;
global.fget_md5 = f_cs;

//preparing engine
with o_pl   { instance_destroy(); }
with o_item { instance_destroy(); }
alarm[0] = 0;
room_speed = 9999;

net_fget_req();

con_add(":: NET: FGET: Скачивание файла: " + f_pt);
con_add(':: NET: FGET: Размер файла: ' + string(f_sz / 1024) + ' Кб.');
con_add(':: NET: FGET: MD5 файла: ' + f_cs);

