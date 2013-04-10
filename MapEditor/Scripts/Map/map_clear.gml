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
  global.map_mus = 'data\music\AC.xm';
  global.map_bkg = 'data\sky\D2DSKY1.png';
  global.map_w = 1600;
  global.map_h = 1600;
  global.map_proc = false;
  global.map_file = working_directory + '\data\maps\*.dlv';
  room_caption = global.ed_apptitle;
} else {
  global.map_proc = true;
};
  
//ed_tools_reset();
API_Combobox_ResetContent(ui_tx_cb);
API_Combobox_AddString(ui_tx_cb, 'Нет текстуры'); //0
API_Combobox_SetSel(ui_tx_cb, 0);

//global.ed_g_sz = 16;
//background_assign(bk_current, bk_grid16);
view_xview = 0;
view_yview = 0;
