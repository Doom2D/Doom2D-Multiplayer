if global.tex_n == MAX_TXRS_NUM {exit;}

var tx_f, transp, tx_nm, t_err, i;
tx_f = argument0;

for (i = 1; i < MAX_TXRS_NUM; i += 1)
{
  if global.tex[i] == noval {break;}
}

if file_exists(tx_f)
{
  transp = string_lower(filename_ext(tx_f)) == '.gif';
  global.tex[i] = sprite_add(tx_f, noval, transp, false, 0, 0);
  sprite_collision_mask(global.tex[i], false, 1, 0, 0, 0, 0, 1, 0);
  t_err = false;
} else {
  global.tex[i] = tex_error;
  t_err = true;
}

tx_nm = path_relative(tx_f);
global.tex_nm[i] = tx_nm;
tx_nm = dp_textures(tx_nm);
if t_err {tx_nm = '*' + tx_nm;}

API_Combobox_AddString(ui_tx_cb, tx_nm);
if !global.map_proc {API_Combobox_SetSel(ui_tx_cb, global.tex_n);}
if API_Window_Exists(ui_win5) {API_Listbox_AddString(ui_win5_lb1, tx_nm);}

global.tex_n += 1;
return !t_err;
