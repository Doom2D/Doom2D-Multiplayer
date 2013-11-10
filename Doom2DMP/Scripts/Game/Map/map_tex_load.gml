var tx_f, transp;
tx_f = argument0;

for (i = 1; i < 256; i += 1)
{
  if global.tex[i] == -1 {break;}
}

if file_exists(tx_f) 
{
  transp = 0;
  if string_lower(filename_ext(tx_f)) == '.gif' {transp = 1;}
  global.tex[i] = sprite_add(tx_f, -1, transp, 0, 0, 0);
  sprite_collision_mask(global.tex[i], 0, 1, 0, 0, 0, 0, 1, 0);
} else {
  con_add(':: MAP: ERROR: Текстура ' + tx_f + ' не найдена.');
  global.tex[i] = tex_error;
}

global.tex_n += 1;
