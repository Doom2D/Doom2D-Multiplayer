var tx_f, tx_nm;
tx_f = argument0;

for (i = 0; i < 256; i += 1)
{
  if global.tex[i] == -1 {break;}
}

if tx_f != '*ERROR' && file_exists(tx_f) 
{
  global.tex[i] = sprite_add(tx_f, -1, 0, 0, 0, 0);
  sprite_collision_mask(global.tex[i], 0, 1, 0, 0, 0, 0, 1, 0);
  tx_nm = string_replace(tx_f, working_directory + '\', '');
  global.tex_nm[i] = tx_nm;
  con_add(":: MAP: TEXTURE: Загружена текстура " + tx_nm + " в слот " + string(i) + ".");
} else {
  con_add(':: MAP: ERROR: Текстура ' + tx_f + ' не найдена. Тайлы с ней будут размером 16x16.');
  global.tex[i] = tex_none;
}

global.tex_n += 1;
