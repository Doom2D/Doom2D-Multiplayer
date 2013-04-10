if global.tex_n == 256 {exit;}

var tx_f, transp, tx_nm;
tx_f = argument0;

for (i = 0; i < 256; i += 1)
{
  if global.tex[i] == -1 {break;}
}

if tx_f != '*ERROR' && file_exists(tx_f)
{
  transp = 0;
  if string_lower(filename_ext(tx_f)) == '.gif' {transp = 1;}
  global.tex[i] = sprite_add(tx_f, -1, transp, 0, 0, 0);
  sprite_collision_mask(global.tex[i], 0, 1, 0, 0, 0, 0, 1, 0);
  tx_nm = string_replace(tx_f, working_directory + '\', '');
  global.tex_nm[i] = tx_nm;
  tx_nm = string_delete(tx_nm, 1, 14);
} else {
  global.tex[i] = tex_error;
  tx_nm = '*ERROR';
  global.tex_nm[i] = tx_nm;
}

global.tex_n += 1;
API_Combobox_AddString(ui_tx_cb, tx_nm);
if API_Window_Exists(ui_win5) {API_Listbox_AddString(ui_win5_lb1, tx_nm);}
