var tx_f, tx_n, transp;
tx_f = argument0;
tx_n = global.tex_n;

if file_exists(tx_f) 
{
  transp = string_lower(filename_ext(tx_f)) == '.gif';
  global.tex[tx_n] = sprite_add(tx_f, -1, transp, 0, 0, 0);
  sprite_collision_mask(global.tex[tx_n], 0, 1, 0, 0, 0, 0, 1, 0);
} else {
  con_add(':: MAP: ERROR: Текстура ' + tx_f + ' не найдена.');
  global.tex[tx_n] = tex_error;
}

global.tex_n += 1;
