//clears the map
//argument0 - checking call from map_load script

io_clear();
ui_windows_destroy(false);
with par_obj {instance_destroy();}

for (i = 1; i < 256; i += 1)
{
  if global.tex[i] != tex_error && sprite_exists(global.tex[i]) {sprite_delete(global.tex[i]);}
  global.tex[i] = -1;
  global.tex_nm[i] = '';
}

global.tex_n = 1;
global.ed_mode = 0;

if !argument0
{
  global.map_name = 'Unnamed Map';
  global.map_desc = 'Temp Description';
  global.map_mus = MAP_NOMUS;
  global.map_bkg = MAP_NOBKG;
  global.map_w = 1600;
  global.map_h = 1600;
  global.map_proc = false;
  global.map_file = working_directory + '\data\maps\*.dlv';
  room_caption = global.ed_apptitle;
  ed_bkg_change();
} else {
  global.map_proc = true;
}

tb_tex_reset(true);

view_xview = 0;
view_yview = 0;
