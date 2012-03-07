//a0 - client id
//a1 - file

if !file_exists(argument1)
{
    con_add(':: SYSTEM: ERROR: Нет такого файла: ' + string(argument0));
}

fsend_path = string(argument1);
fsend_file = file_bin_open(fsend_path, 0);
fsend_size = file_bin_size(fsend_file);
fsend_md5 = file_md5(argument1); //file's md5
if filename_ext(argument1) == '.7z' && file_exists('data\maps\' + string_replace(filename_name(argument1), '.7z', '.dlv')) {fsend_cmd5 = file_md5('data\maps\' + string_replace(filename_name(argument1), '.7z', '.dlv'));} else {fsend_cmd5 = '';} //md5 of file's contents if it is a 7z
fsend_state = 1;

con_add(':: NET: FSEND: Посылаем клиенту ' + id_to_cl(argument0).cl_name + ' файл ' + fsend_path + '...');
con_add(':: NET: FSEND: Размер: ' + string(fsend_size) + ' байт.');
con_add(':: NET: FSEND: MD5: ' + fsend_md5);
if filename_ext(argument1) == '.7z' {con_add(':: NET: FSEND: MD5 содержимого: ' + fsend_cmd5);}
net_fsend_state(argument0);

