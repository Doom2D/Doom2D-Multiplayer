var tx_f, tx_n, tx_nm;
tx_f = argument0;
tx_n = global.tex_n;

if file_exists(tx_f) 
{
  global.tex[tx_n] = sprite_add(tx_f, -1, 0, 0, 0, 0);
  sprite_collision_mask(global.tex[tx_n], 0, 1, 0, 0, 0, 0, 1, 0);
  tx_nm = path_relative(tx_f);
  global.tex_nm[tx_n] = tx_nm;
  con_add(":: MAP: TEXTURE: Загружена текстура " + tx_nm + " в слот " + string(tx_n) + ".");
} else {
  con_add(':: MAP: ERROR: Текстура ' + tx_f + ' не найдена. Тайлы с ней будут размером 16x16.');
  global.tex[tx_n] = tex_none;
}

global.tex_n += 1;
