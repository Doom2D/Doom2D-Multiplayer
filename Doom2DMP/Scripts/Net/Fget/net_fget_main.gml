//receives a server-sent file
//a0 - filename
//a1 - size
//a2 - md5
//a3 - 7z contents md5

con_add(":: NET: FGET: Сервер пытается прислать файл " + string(argument0) + "...");

if argument3 != ''
{
    var mapf;
    mapf = string_replace('data\maps\' + filename_name(argument0), '.7z', '.dlv');
    con_add(':: NET: FGET: ' + argument0 + ' - архив.');
    if file_exists(mapf)
    {
        con_add(':: NET: FGET: WARNING: Содержимое архива - ' + mapf + ' - уже существует. Проверяем MD5...');
        var m;
        m = file_md5(mapf);
        if m == argument3
        {
            con_add(':: NET: FGET: WARNING: MD5 содержимого совпадают. Передача прервана.');
            net_fget_abort();
            global.map_done = 1;
            exit;
        }
        else
        {
            if global.cl_dl_override
            {
                con_add(':: NET: FGET: WARNING: MD5 содержимого не совпадают. Файл удален.');
                file_delete(mapf);
            }
            else
            {
                con_add(':: NET: FGET: ERROR: MD5 содержимого не совпадают. Перезапись запрещена.');
                net_fget_abort();
                sleep(10);
                cl_disconnect();
                mus_play(global.mus_menu);
                room_goto(rm_menu);
            }
        }
    }
}

if file_exists(argument0)
{
        con_add(':: NET: FGET: WARNING: Файл ' + argument0 + ' уже существует. Проверяем MD5...');
        var m;
        m = file_md5(argument0);
        if m == argument2
        {
            con_add(':: NET: FGET: WARNING: MD5 совпадают. Передача прервана.');
            net_fget_abort();
            global.map_done = 1;
            exit;
        }
        else
        {
            if global.cl_dl_override
            {
                con_add(':: NET: FGET: WARNING: MD5 не совпадают. Файл удален.');
                file_delete(argument0);
            }
            else
            {
                con_add(':: NET: FGET: ERROR: MD5 не совпадают. Перезапись запрещена.');
                net_fget_abort();
                sleep(10);
                cl_disconnect();
                mus_play(global.mus_menu);
                room_goto(rm_menu);
            }
        }
}

if !global.cl_dl_allow
{
    con_add(':: NET: FGET: Передача файлов запрещена.');
    net_fget_abort();
    sleep(10);
    cl_disconnect();
    mus_play(global.mus_menu);
    room_goto(rm_menu);
    exit;
}


global.fget_path = string(argument0);
global.fget_file = file_bin_open(global.fget_path, 1);
global.fget_size = argument1;
global.fget_md5 = '';
global.fget_state = 1;

con_add(":: NET: FGET: Принимаем файл " + global.fget_path + "...");
con_add(':: NET: FGET: Предполагаемый размер: ' + string(global.fget_size) + ' байт.');
con_add(':: NET: FGET: Предполагаемый MD5 карты внутри: ' + argument3);
