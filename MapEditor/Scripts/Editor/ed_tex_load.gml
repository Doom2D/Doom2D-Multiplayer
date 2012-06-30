tx_f = argument0;
transp = 0;
if string_lower(filename_ext(tx_f)) == '.gif' {transp = 1;}

if !file_exists(tx_f) {exit;}
for (i = 0; i < 256; i += 1)
{
  if global.tex[i] == -1 {break;}
}

if tx_f != "NO_TEXTURE" {global.tex[i] = sprite_add(tx_f, -1, transp, 0, 0, 0);} else {global.tex[i] = tex_none;}
sprite_collision_mask(global.tex[i], 0, 1, 0, 0, 0, 0, 1, 0);


global.tex_n += 1;

tx_nm = tx_f;
tx_nm = string_replace(tx_nm, string(working_directory) + '\', '');
global.tex_nm[i] = tx_nm;
tx_nm = string_replace(tx_nm, 'data\textures\', '');

API_Combobox_AddString(ui_tx_cb, tx_nm);
