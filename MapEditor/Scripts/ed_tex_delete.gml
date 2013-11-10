//arg0 - texture index

var tx_del;
tx_del = argument0;

with par_obj
{
  if o_id > 6 {continue;}
  if t_id == tx_del {return false;}
}

with par_obj
{
  if o_id > 6 {continue;}
  if t_id > tx_del {t_id -= 1;}
}

if global.tex[tx_del] != tex_error && sprite_exists(global.tex[tx_del]) {sprite_delete(global.tex[tx_del]);}
global.tex[tx_del] = -1;
global.tex_nm[tx_del] = '';
global.tex_n -= 1;

var t_sw;
for (i = tx_del; i < global.tex_n; i += 1)
{
  t_sw = global.tex[i];
  global.tex[i] = global.tex[i + 1];
  global.tex[i + 1] = t_sw;
  
  t_sw = global.tex_nm[i];
  global.tex_nm[i] = global.tex_nm[i + 1];
  global.tex_nm[i + 1] = t_sw;
}

API_Combobox_SetSel(ui_tx_cb, 0);
API_Combobox_DeleteString(ui_tx_cb, tx_del);
if API_Window_Exists(ui_win5) {API_Listbox_DeleteString(ui_win5_lb1, tx_del - 1);}

return true;
