//a0 - path to the texture

var chtex;
chtex = path_relative(argument0);

for (q = 1; q < global.tex_n; q += 1)
{
  if global.tex_nm[q] == chtex
  {
    message_box('Текстура ' + dp_textures(chtex) + ' уже есть в списке.',
                'Ошибка', MB_OK|MB_ICONWARNING);
    return false;
  }
}

return true;
