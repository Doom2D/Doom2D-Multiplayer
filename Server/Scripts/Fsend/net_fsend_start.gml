//arg0 - file

var f_pt;
f_pt = string(argument0);

if !file_exists(f_pt)
{
  con_add(':: SYSTEM: ERROR: Файл не найден: ' + f_pt);
  exit;
}

fsend_file = f_pt;
fsend_buf = load_file(f_pt);
fsend_size = dll39_buffer_size(fsend_buf);
fsend_md5 = dll39_md5_buffer(fsend_buf);

//md5 of file's contents if it is a 7z
if string_lower( filename_ext(f_pt) ) == '.7z'
{
  fsend_cmd5 = file_md5( 'data\maps\' + filename_change_ext( filename_name(f_pt), '.dlv' ) );
}

fsend_state = true;

x = -9000; 
y = -9000; 
plr_send_pos();    
hp = 0;
dead = 1;

if fsend_cmd5 != '' {con_add(':: NET: FSEND: MD5 содержимого: ' + fsend_cmd5);}
con_add(':: NET: FSEND: MD5: ' + fsend_md5);
con_add(':: NET: FSEND: Размер: ' + string(fsend_size) + ' байт.');
con_add(':: NET: FSEND: Посылаем клиенту ' + cl_name + ' файл ' + f_pt + '...');
net_fsend_state(true);

