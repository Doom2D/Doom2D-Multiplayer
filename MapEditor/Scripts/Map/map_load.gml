//load map

var temp_fn;
temp_fn = get_open_filename('Карты Doom2DMP 0.6 (*.DLV)|*.dlv', global.map_file);
if !file_exists(temp_fn) {exit;}

map_clear(true);
global.map_file = temp_fn;

var fnum;
fnum = file_text_open_read(temp_fn);

global.map_name = file_text_read_string(fnum);
file_text_readln(fnum);
global.map_desc = file_text_read_string(fnum);
file_text_readln(fnum);
global.map_w = real(file_text_read_string(fnum));
file_text_readln(fnum);
global.map_h = real(file_text_read_string(fnum));
file_text_readln(fnum);
global.map_mus = file_text_read_string(fnum);
file_text_readln(fnum);
global.map_bkg = file_text_read_string(fnum);
file_text_readln(fnum);

var tx_n;
tx_n = real(file_text_read_string(fnum));
file_text_readln(fnum);

if tx_n > 256
{
  file_text_close(fnum);
  map_clear(false);
  API_Dialog_MessageBox(window_handle(),
      'Количество текстур на карте превышает лимит.' + chr(10) + chr(13) +
      'Загрузка карты прекращена.',
      'Ошибка', MB_OK|MB_ICONERROR);
  exit;
}

var err_l;
err_l = false;
for (j = 1; j < tx_n; j += 1)
{
  if !ed_tex_load(file_text_read_string(fnum)) {err_l = true;}
  file_text_readln(fnum);
}

var obj_id, ext_id, o_x, o_y, tg_sx, tg_sy, tg_x1, tg_y1, tg_x2, tg_y2;
obj_id = -1; ext_id = -1;
o_x = -1; o_y = -1;
tg_sx = 0; tg_sy = 0;
tg_x1 = 0; tg_y1 = 0;
tg_x2 = 0; tg_y2 = 0;

while !file_text_eof(fnum)
{
  obj_id = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  ext_id = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  o_x = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  o_y = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  if obj_id > 43 && obj_id < 49
  {
    tg_sx = real(file_text_read_string(fnum));
    file_text_readln(fnum);
    tg_sy = real(file_text_read_string(fnum));
    file_text_readln(fnum);
    if ext_id != 8
    {
      tg_x1 = real(file_text_read_string(fnum));
      file_text_readln(fnum);
      tg_y1 = real(file_text_read_string(fnum));
      file_text_readln(fnum);
      if ext_id != 7
      {
        tg_x2 = real(file_text_read_string(fnum));
        file_text_readln(fnum);
        tg_y2 = real(file_text_read_string(fnum));
        file_text_readln(fnum);
      }
    }
  }
  map_obj_create(obj_id, ext_id, o_x, o_y, tg_sx, tg_sy, tg_x1, tg_y1, tg_x2, tg_y2);
}

file_text_close(fnum);
alarm[0] = 5;
ed_bkg_change();

if err_l
{
  API_Dialog_MessageBox(window_handle(),
      'Некоторые текстуры не были загружены.',
      'Ошибка', MB_OK|MB_ICONWARNING);
}
