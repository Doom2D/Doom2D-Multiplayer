//clears the map
with par_obj {instance_destroy();}

for (i = 1; i < 256; i += 1)
{
  if sprite_exists(global.tex[i]) {sprite_delete(global.tex[i]);}
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
  global.tex_n = 0;
}

global.map_name = 'Unnamed Map';
global.map_desc = 'Temp Description';
global.map_mus = 'data\music\AC.xm';
global.map_bkg = 'data\sky\D2DSKY1.png';
global.map_loaded = false;
global.map_w = 1600;
global.map_h = 1600;

API_Combobox_ResetContent(ui_tx_cb);
API_Combobox_AddString(ui_tx_cb, 'Нет текстуры'); //0
API_Combobox_SetSel(ui_tx_cb, 0);

view_xview = 0;
view_yview = 0;
