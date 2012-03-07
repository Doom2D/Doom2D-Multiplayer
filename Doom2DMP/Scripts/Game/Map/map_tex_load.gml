tx_f = argument0;

if !file_exists(tx_f) 
{
    con_add(":: MAP: ERROR: Нет такой текстуры " + tx_f + ". Тайлы с ней будут прозрачными.");
    tx_f = 'NO_TEXTURE';
}

for (i = 0; i < 256; i += 1)
{
  if global.tex[i] == -1 {break;}
}

if tx_f != "NO_TEXTURE" {if filename_ext(tx_f) != '.gif' {global.tex[i] = sprite_add(tx_f, -1, 0, 0, 0, 0);} else {global.tex[i] = sprite_add(tx_f, -1, 1, 0, 0, 0);}} else {global.tex[i] = tex_none;}
global.tex_n += 1;

sprite_collision_mask(global.tex[i], 0, 1, 0, 0, 0, 0, 1, 0);

tx_nm = tx_f;
tx_nm = string_replace(tx_nm, string(working_directory) + '\', '');
global.tex_nm[i] = tx_nm;
tx_nm = string_replace(tx_nm, 'data\textures\', '');
