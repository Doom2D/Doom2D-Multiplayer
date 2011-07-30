//load map
f = get_open_filename('D2DMP Maps|*.dlv', 'data\maps\Unnamed.dlv');
if !file_exists(f) {exit;}
with par_obj {instance_destroy();}

for (i = 0; i < 1024; i += 1)
{
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}
global.tex[0] = tex_none;
global.tex_n = 1;
ed_tools_reset();

file = file_text_open_read(f);
global.map_name = file_text_read_string(file);
file_text_readln(file);
global.map_desc = file_text_read_string(file);
file_text_readln(file);
global.map_w =  real(file_text_read_string(file));
file_text_readln(file);
global.map_h = real(file_text_read_string(file));
file_text_readln(file);
global.map_mus = file_text_read_string(file);
file_text_readln(file);
global.map_bkg = file_text_read_string(file);
file_text_readln(file);
tx_n = real(file_text_read_string(file));
file_text_readln(file);
for (i = 1; i < tx_n; i += 1)
{
  ed_tex_load(file_text_read_string(file));
  file_text_readln(file);
}
while !file_text_eof(file)
{
  o_id = real(file_text_read_string(file));
  file_text_readln(file);
  t_id = real(file_text_read_string(file));
  file_text_readln(file);
  o_x = real(file_text_read_string(file));
  file_text_readln(file);
  o_y = real(file_text_read_string(file));
  file_text_readln(file);
  map_obj_create(o_id, t_id, o_x, o_y);
}
file_text_close(file);
