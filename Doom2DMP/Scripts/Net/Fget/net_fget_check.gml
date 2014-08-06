//checks file and decides to continue fget or not
//returns result of decision
//arg0 - file to check
//arg1 - its md5

var fname, fhash;
fname = argument0;
fhash = argument1;

if file_exists(fname)
{
  con_add(':: NET: FGET: WARNING: Файл ' + fname + ' уже существует. Проверяем MD5...');
  if fhash == file_md5(fname)
  {
    con_add(':: NET: FGET: WARNING: MD5 совпадают. Передача прервана.');
    net_fget_abort(true);
    return false;
  }
  else
  {
    if global.cl_dl_override
    {
      con_add(':: NET: FGET: WARNING: MD5 не совпадают. Файл будет перезаписан.');
      file_delete(fname);
    }
    else
    {
      con_add(':: NET: FGET: ERROR: MD5 не совпадают. Передача прервана, поскольку перезапись запрещена.');
      net_fget_abort(false);
      sleep(10);
      cl_disconnect();
      mus_play(global.mus_menu);
      room_goto(rm_menu);
      return false;
    }
  }
}

return true;

