tx_f = get_open_filename('TGAs |*.tga', 'data\textures\STD_1_16_16.tga')
for (i = 0; i < 1024; i += 1)
{
  if global.tex[i] == -1 {break;}
}
global.tex[i] = sprite_add(tx_f, 0, 0, 0, 0, 0);

tx_nm = tx_f;
tx_nm = string_replace(tx_nm, string(working_directory), '');
tx_nm = string_replace(tx_nm, 'data\textures\', '');

API_Combobox_AddString(ui_tx_cb, tx_nm);
