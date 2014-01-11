//a0 - file

var f_pt;
f_pt = string(argument0);

if !file_exists(f_pt)
{
  con_add(':: SYSTEM: ERROR: Файл не найден: ' + f_pt);
  exit;
}

if dll39_buffer_exists(fsend_buf) {dll39_buffer_free(fsend_buf);}
fsend_buf = dll39_buffer_create();
fsend_path = f_pt;
fsend_md5 = file_md5(f_pt);
fsend_file = dll39_file_open(f_pt, dll39_access_read);
fsend_size = dll39_file_size(fsend_file);
fsend_pos = 0;

//md5 of file's contents if it is a 7z
if string_lower( filename_ext(f_pt) ) == '.7z'
{
  fsend_cmd5 = file_md5( 'data\maps\' + filename_change_ext( filename_name(f_pt), '.dlv' ) );
} else {
  fsend_cmd5 = '';
}

fsend_state = 1;

x = -9000; 
y = -9000; 
plr_send_pos();    
hp = 0;
dead = 1;

if fsend_cmd5 != '' {con_add(':: NET: FSEND: MD5 содержимого: ' + fsend_cmd5);}
con_add(':: NET: FSEND: MD5: ' + fsend_md5);
con_add(':: NET: FSEND: Размер: ' + string(fsend_size) + ' байт.');
con_add(':: NET: FSEND: Посылаем клиенту ' + cl_name + ' файл ' + f_pt + '...');
net_fsend_state();

