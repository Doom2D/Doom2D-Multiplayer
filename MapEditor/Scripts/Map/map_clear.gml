//clears the map
//argument0 - checking call from map_load script

io_clear();
ui_windows_destroy(false);
with par_obj {instance_destroy();}

for (i = 1; i < MAX_TXRS_NUM; i += 1)
{
  if global.tex[i] != tex_error && sprite_exists(global.tex[i]) {sprite_delete(global.tex[i]);}
  global.tex[i] = noval;
  global.tex_nm[i] = '';
}

global.tex_n = 1;
global.ed_mode = MODE_NORMAL;

if !argument0
{
  map_init()
  room_caption = global.ed_apptitle;
  ed_bkg_change();
  global.map_proc = false;
} else {
  global.map_proc = true;
}

tb_tex_reset(true);

view_xview = 0;
view_yview = 0;
