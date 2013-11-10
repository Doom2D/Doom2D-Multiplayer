//a0 - file

var f_pt;
f_pt = string(argument0);

if !file_exists(f_pt)
{
  con_add(':: SYSTEM: ERROR: Файл не найден: ' + f_pt);
  exit;
}

if dybufferexists(fsend_buf) {dyfreebuffer(fsend_buf);}
fsend_buf = dycreatebuffer();
fsend_path = f_pt;
fsend_file = dyfileopen(f_pt, 0);
fsend_size = dyfilesize(fsend_file);
fsend_pos = 0;
fsend_md5 = file_md5(f_pt); //file's md5

var f_ex, m_pt;
f_ex = filename_ext(f_pt);
m_pt = string_replace('data\maps\' + filename_name(f_pt), f_ex, '.dlv')
if string_lower(f_ex) == '.7z' && file_exists(m_pt) {fsend_cmd5 = file_md5(m_pt);} else {fsend_cmd5 = '';} //md5 of file's contents if it is a 7z

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

