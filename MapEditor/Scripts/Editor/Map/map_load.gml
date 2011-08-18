//load map
io_clear();
global.ed_g_sz = 16; //grid size
background_assign(bk_current, bk_grid16);

f = get_open_filename('D2DMP Maps|*.dlv', 'data\maps\Unnamed.dlv');
if !file_exists(f) {exit;}
with par_obj {instance_destroy();}
global.map_loaded = false;

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
  var tf;
  tf = file_text_read_string(file);
  if !file_exists(tf) {tf = 'data\textures\NO_TEXTURE.png';}
  ed_tex_load(tf);
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
alarm[0] = 5;
