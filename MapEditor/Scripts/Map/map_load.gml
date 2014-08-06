//load map
//a0 - map filename string (if empty, show file opening dialog)

var temp_fn;
temp_fn = string(argument0);
if temp_fn == ''
{
  temp_fn = get_open_filename('Карты Doom2DMP 0.6 (*.DLV)|*.dlv', global.map_file);
} else {
  if string_lower(filename_ext(temp_fn)) != '.dlv' {exit;}
}

if !file_exists(temp_fn) {exit;}
map_clear(true);
global.map_file = temp_fn;

var fnum;
fnum = file_text_open_read(temp_fn);

global.map_name = file_text_read_string(fnum); file_text_readln(fnum);
global.map_desc = file_text_read_string(fnum); file_text_readln(fnum);
global.map_w = file_text_read_real(fnum); file_text_readln(fnum);
global.map_h = file_text_read_real(fnum); file_text_readln(fnum);
global.map_mus = file_text_read_string(fnum); file_text_readln(fnum);
global.map_bkg = file_text_read_string(fnum); file_text_readln(fnum);

var tx_n;
tx_n = file_text_read_real(fnum); file_text_readln(fnum);

if tx_n > MAX_TXRS_NUM
{
  file_text_close(fnum);
  map_clear(false);
  message_box('Количество текстур на карте превышает лимит.' + EOL +
              'Загрузка карты прекращена.',
              'Ошибка', MB_OK|MB_ICONERROR);
  exit;
}

var err_l, i;
err_l = false;
for (i = 1; i < tx_n; i += 1)
{
  if !ed_tex_load(file_text_read_string(fnum)) {err_l = true;}
  file_text_readln(fnum);
}

var obj_id, ext_id, obj_x, obj_y, tg_sx, tg_sy, tg_x1, tg_y1, tg_x2, tg_y2;
tg_sx = 0; tg_sy = 0;
tg_x1 = 0; tg_y1 = 0;
tg_x2 = 0; tg_y2 = 0;

while !file_text_eof(fnum)
{
  obj_id = file_text_read_real(fnum); file_text_readln(fnum);
  ext_id = file_text_read_real(fnum); file_text_readln(fnum);
  obj_x = file_text_read_real(fnum); file_text_readln(fnum);
  obj_y = file_text_read_real(fnum); file_text_readln(fnum);
  if obj_trig(obj_id)
  {
    tg_sx = file_text_read_real(fnum); file_text_readln(fnum);
    tg_sy = file_text_read_real(fnum); file_text_readln(fnum);
    if ext_id != TRAC_ENDROUND
    {
      tg_x1 = file_text_read_real(fnum); file_text_readln(fnum);
      tg_y1 = file_text_read_real(fnum); file_text_readln(fnum);
      if ext_id != TRAC_TELEPORT
      {
        tg_x2 = file_text_read_real(fnum); file_text_readln(fnum);
        tg_y2 = file_text_read_real(fnum); file_text_readln(fnum);
      }
    }
  }
  map_obj_create(obj_id, ext_id, obj_x, obj_y, tg_sx, tg_sy, tg_x1, tg_y1, tg_x2, tg_y2);
}

file_text_close(fnum);
ed_bkg_change();

if err_l
{
  message_box('Некоторые текстуры не были загружены.',
              'Ошибка', MB_OK|MB_ICONWARNING);
}

ui_upd_title();
global.map_proc = false;

