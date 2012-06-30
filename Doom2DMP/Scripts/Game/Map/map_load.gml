//load map
//argument0 - filename
global.map_md5 = '';

f = 'data\maps\' + argument0 + '.dlv';

if !file_exists(f) 
{
    con_add(":: MAP: ERROR: Карты " + f + " не существует.");
    cl_disconnect();
    mus_play(global.mus_menu);
    room_goto(rm_menu);
    exit;
}

//free the shit for less lags
for (i = 0; i < 256; i += 1)
{
  if sprite_exists(global.tex[i]) && global.tex[i] != -1 {sprite_delete(global.tex[i]);}
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}

//and this shit
if global.map_bkg != bkg_inter
{
    if background_exists(global.map_bkg) {background_delete(global.map_bkg);}
    global.map_bkg = bkg_inter;
}

//and this shit
if global.map_mus != -1
{
    FMODSoundFree(global.map_mus);
}

global.tex[0] = tex_none;
global.tex_n = 1;

file = file_text_open_read(f);
global.map_name = file_text_read_string(file);
file_text_readln(file);
global.map_desc = file_text_read_string(file);
file_text_readln(file);
global.map_w = file_text_read_real(file);
file_text_readln(file);
global.map_h = file_text_read_real(file);
file_text_readln(file);
_mus = file_text_read_string(file);
if !file_exists(_mus) {_mus = 'data\music\AC.xm';}
global.map_mus = FMODSoundAdd(_mus);
FMODSoundSetGroup(global.map_mus, 3);
file_text_readln(file);
_bkg = file_text_read_string(file);
if !file_exists(_bkg) {_bkg = 'data\textures\sky\DFSKY0.png';}
global.map_bkg = background_add(_bkg, 0, 0);
file_text_readln(file);
tx_n = real(file_text_read_string(file));
file_text_readln(file);
for (i = 1; i < tx_n; i += 1)
{
  map_tex_load(file_text_read_string(file));
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

global.map_md5 = file_md5(f);

mus_play(global.map_mus);
if !global.r_gfx {instance_deactivate_object(o_bkg);}
con_add(':: MAP: Загружена карта ' + argument0);
