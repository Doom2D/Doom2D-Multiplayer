//saves current map
//a0 - checking call from "save as"

if argument0 || !file_exists(global.map_file)
{
  var get_fn;
  get_fn = dlg_savefile('Карты Doom2DMP 0.6 (*.DLV)|*.dlv', global.map_file, '.dlv');
  if get_fn == '' {exit;}
  global.map_file = get_fn;
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
