//inits dlls, vars and other shit
API_Init ();

//texture array
for (i = 0; i < 256; i += 1)
{
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}
global.tex[0] = tex_none;
global.tex_n = 1;


//map settings
global.map_name = 'Unnamed Map';
global.map_desc = 'Temp Description';
global.map_mus = 'data\music\AC.xm';
global.map_bkg = 'data\sky\D2DSKY1.png';
global.map_loaded = false;
global.map_w = 1600;
global.map_h = 1600;

//editor settings
global.ed_g_sz = 16; //grid size
background_assign(bk_current, bk_grid16);
global.ed_g_vis = true; //is it visible
global.ed_overdel = true; //delete overlaying objects
global.ed_outline = false; //outline the objects
x_off = 0;
x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;
tw = 0;
th = 0;
col = 0;
y_off = 0;
spr = -1;
tx = 0;
im = 0;
