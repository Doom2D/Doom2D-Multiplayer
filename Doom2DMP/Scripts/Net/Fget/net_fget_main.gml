//receives a server-sent file
//a0 - filename
//a1 - size
//a2 - md5
//a3 - 7z contents md5

if global.dem_mode >= 2 {global.map_done = 1; exit;}

var f_pt, f_nm, f_sz, f_cs, d_cs, m_cs;
f_pt = string(argument0);
f_nm = filename_name(f_pt);
f_sz = argument1;
f_cs = argument2;
d_cs = argument3;

con_add(":: NET: FGET: Сервер пытается прислать файл " + f_nm + "...");

if !global.cl_dl_allow
{
  con_add(':: NET: FGET: Прием файлов отключен. Передача прервана.');
  net_fget_abort();
  sleep(10);
  cl_disconnect();
  mus_play(global.mus_menu);
  room_goto(rm_menu);
  exit;
}

if d_cs != ''
{
  var mapf;
  mapf = 'data\maps\' + filename_change_ext(f_nm, '.dlv');
  con_add(':: NET: FGET: ' + f_nm + ' - архив.');
  if file_exists(mapf)
  {
    con_add(':: NET: FGET: WARNING: Файл ' + mapf + ' уже существует. Проверяем MD5...');
    m_cs = file_md5(mapf);
    if m_cs == d_cs
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
        con_add(':: NET: FGET: WARNING: MD5 не совпадают. Файл будет перезаписан.');
        file_delete(mapf);
      }
      else
      {
        con_add(':: NET: FGET: ERROR: MD5 не совпадают. Передача прервана, поскольку перезапись запрещена.');
        net_fget_abort();
        sleep(10);
        cl_disconnect();
        mus_play(global.mus_menu);
        room_goto(rm_menu);
        exit;
      }
    }
  }
}

if file_exists(f_pt)
{
  con_add(':: NET: FGET: WARNING: Файл ' + f_pt + ' уже существует. Проверяем MD5...');
  m_cs = file_md5(f_pt);
  if m_cs == f_cs
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
      con_add(':: NET: FGET: WARNING: MD5 не совпадают. Файл будет перезаписан.');
      file_delete(f_pt);
    }
    else
    {
      con_add(':: NET: FGET: ERROR: MD5 не совпадают. Передача прервана, поскольку перезапись запрещена.');
      net_fget_abort();
      sleep(10);
      cl_disconnect();
      mus_play(global.mus_menu);
      room_goto(rm_menu);
      exit;
    }
  }
}

if dll39_buffer_exists(global.fget_buf) {dll39_buffer_free(global.fget_buf);}
global.fget_buf = dll39_buffer_create();
global.fget_path = f_pt;
global.fget_file = dll39_file_open(f_pt, dll39_access_write);
global.fget_size = f_sz;
global.fget_md5 = '';
global.fget_state = 1;
global.fget_pos = 0;

dll39_write_byte(16, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);

con_add(":: NET: FGET: Принимаем файл " + f_pt + "...");
con_add(':: NET: FGET: Предполагаемый размер: ' + string(f_sz) + ' байт.');
con_add(':: NET: FGET: Предполагаемый MD5 карты: ' + d_cs);
