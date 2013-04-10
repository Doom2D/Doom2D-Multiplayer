//saves current map
//a0 - checking call from "save as"

if argument0 || global.map_file == working_directory + '\data\maps\*.dlv'
{
    var temp_fn;
    temp_fn = get_save_filename('Карты Doom2DMP 0.6 (*.DLV)|*.dlv', global.map_file);
    if temp_fn == '' {exit;}
    if string_lower(string_copy(temp_fn, string_length(temp_fn)-3, 4)) != '.dlv' {temp_fn += '.dlv';}
    if file_exists(temp_fn)
    {
        if API_Dialog_MessageBox(window_handle(),
               'Файл "' + filename_name(temp_fn) + '" уже существует.'
               + chr(13) + chr(10) +
               'Перезаписать?',
               '', MB_YESNO|MB_ICONWARNING) == 7 {exit;}
    }
    global.map_file = temp_fn;
}

var fnum;
fnum = file_text_open_write(global.map_file);

file_text_write_string(fnum, global.map_name);
file_text_writeln(fnum);
file_text_write_string(fnum, global.map_desc);
file_text_writeln(fnum);
file_text_write_string(fnum, string(global.map_w));
file_text_writeln(fnum);
file_text_write_string(fnum, string(global.map_h));
file_text_writeln(fnum);
file_text_write_string(fnum, global.map_mus);
file_text_writeln(fnum);
file_text_write_string(fnum, global.map_bkg);
file_text_writeln(fnum);
file_text_write_string(fnum, string(global.tex_n));
file_text_writeln(fnum);

for (i = 1; i < global.tex_n; i += 1)
{
  file_text_write_string(fnum, global.tex_nm[i]);
  file_text_writeln(fnum);
}

with par_obj
{
  file_text_write_string(fnum, string(o_id));
  file_text_writeln(fnum);
  if o_id > 43 && o_id < 49
  {
    if timer > 0 {file_text_write_string(fnum, string(500 + timer - (t_id != 4) * 400));} else {file_text_write_string(fnum, string(t_id));}
  }
  else
  {
    file_text_write_string(fnum, string(t_id));
  }
  file_text_writeln(fnum);
  file_text_write_string(fnum, string(x));
  file_text_writeln(fnum);
  file_text_write_string(fnum, string(y));
  file_text_writeln(fnum);
  if o_id > 43 && o_id < 49
  {
    file_text_write_string(fnum, string(image_xscale));
    file_text_writeln(fnum);
    file_text_write_string(fnum, string(image_yscale));
    file_text_writeln(fnum);
    if t_id != 8
    {
      file_text_write_string(fnum, string(xx[1]));
      file_text_writeln(fnum);
      file_text_write_string(fnum, string(yy[1]));
      file_text_writeln(fnum);
      if t_id != 7
      {
        file_text_write_string(fnum, string(xx[2]));
        file_text_writeln(fnum);
        file_text_write_string(fnum, string(yy[2]));
        file_text_writeln(fnum);
      }
    }
  }
}

file_text_close(fnum);
ui_upd_title();
