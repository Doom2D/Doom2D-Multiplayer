//this releases all map resources

//releasing textures
var i, tx_n;
tx_n = global.tex_n;
for (i = 1; i < tx_n; i += 1)
{
  if global.tex[i] != tex_error {sprite_delete(global.tex[i]);}
  global.tex[i] = -1;
}
global.tex_n = 1;

//releasing background
if global.map_bkg != -1
{
  background_delete(global.map_bkg);
  global.map_bkg = -1;
  o_camera.visible = false;
}

//releasing music
if global.map_mus != -1
{
  FMODSoundFree(global.map_mus);
  global.map_mus = -1;
}

if global.cl_tiles != -1 {ds_list_destroy(global.cl_tiles);}
