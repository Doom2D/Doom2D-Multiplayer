//arg0 - texture index

var tx_del;
tx_del = argument0;

with par_obj
{
  if !obj_wblock(o_id) {continue;}
  if t_id == tx_del {return false;}
}

with par_obj
{
  if !obj_wblock(o_id) {continue;}
  if t_id > tx_del {t_id -= 1;}
}

if global.tex[tx_del] != tex_error && sprite_exists(global.tex[tx_del]) {sprite_delete(global.tex[tx_del]);}
global.tex_n -= 1;

var t_sw;
for (t_sw = tx_del; t_sw < global.tex_n; t_sw += 1)
{
  global.tex[t_sw] = global.tex[t_sw + 1]
  global.tex_nm[t_sw] = global.tex_nm[t_sw + 1]
}

global.tex[t_sw] = noval;
global.tex_nm[t_sw] = '';

API_Combobox_SetSel(ui_tx_cb, NO_TEXTURE);
API_Combobox_DeleteString(ui_tx_cb, tx_del);
if API_Window_Exists(ui_win5) {API_Listbox_DeleteString(ui_win5_lb1, tx_del - 1);}

return true;
