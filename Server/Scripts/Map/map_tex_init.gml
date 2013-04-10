//inits the texture arrays
for (i = 0; i < 256; i += 1)
{
  global.tex[i] = -1;
  global.tex_nm[i] = '';
}
global.tex[0] = tex_none;
global.tex_n = 1;
