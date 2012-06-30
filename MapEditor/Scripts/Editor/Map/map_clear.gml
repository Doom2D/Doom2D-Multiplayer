//clears the map
//argument0 - checking call from map_load script

io_clear();
with par_obj {instance_destroy();}

for (i = 1; i < 256; i += 1)
{
  if sprite_exists(global.tex[i]) {sprite_delete(global.tex[i]);}
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}

global.tex_n = 1;
global.map_loaded = false;

if !argument0
{
  global.map_name = 'Unnamed Map';
  global.map_desc = 'Temp Description';
  global.map_mus = 'data\music\AC.xm';
  global.map_bkg = 'data\sky\D2DSKY1.png';
  global.map_w = 1600;
  global.map_h = 1600;
};
  
//ed_tools_reset();
API_Combobox_ResetContent(ui_tx_cb);
API_Combobox_AddString(ui_tx_cb, 'Нет текстуры'); //0
API_Combobox_SetSel(ui_tx_cb, 0);

//global.ed_g_sz = 16;
//background_assign(bk_current, bk_grid16);
view_xview = 0;
view_yview = 0;
