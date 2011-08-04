tx_f = argument0;

if !file_exists(tx_f) 
{
    con_add(":: MAP: ERROR: Нет такой текстуры " + tx_f + ".");
    exit;
}

for (i = 0; i < 1024; i += 1)
{
  if global.tex[i] == -1 {break;}
}

global.tex[i] = sprite_add(tx_f, 0, 0, 0, 0, 0);
global.tex_n += 1;

sprite_collision_mask(global.tex[i], 0, 1, 0, 0, 0, 0, 1, 0);

tx_nm = tx_f;
tx_nm = string_replace(tx_nm, string(working_directory) + '\', '');
global.tex_nm[i] = tx_nm;
tx_nm = string_replace(tx_nm, 'data\textures\', '');
