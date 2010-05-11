//saves current map
f = get_save_filename('D2DMP Maps|*.dlv', 'data\maps\Unnamed.dlv');
file = file_text_open_write(f);
file_text_write_string(file, global.map_name);
file_text_writeln(file);
file_text_write_string(file, global.map_desc);
file_text_writeln(file);
file_text_write_string(file, global.map_mus);
file_text_writeln(file);
file_text_write_string(file, global.map_bkg);
file_text_writeln(file);
file_text_write_string(file, string(global.tex_n));
file_text_writeln(file);
for (i = 1; i < global.tex_n; i += 1)
{
  file_text_write_string(file, global.tex_nm[i]);
  file_text_writeln(file);
}
with par_obj
{
  file_text_write_string(file, string(o_id));
  file_text_writeln(file);
  file_text_write_string(file, string(t_id));
  file_text_writeln(file);
  file_text_write_string(file, string(x));
  file_text_writeln(file);
  file_text_write_string(file, string(y));
  file_text_writeln(file);
}
file_text_close(file);
