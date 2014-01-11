//load map
//argument0 - filename

var temp_fn;
temp_fn = 'data\maps\' + argument0 + '.dlv';
if !file_exists(temp_fn) 
{
    con_add(":: MAP: ERROR: Карты " + temp_fn + " не существует.");
    cl_disconnect();
    mus_play(global.mus_menu);
    room_goto(rm_menu);
    exit;
}

//free the shit for less lags
for (i = 1; i < 256; i += 1)
{
  if global.tex[i] != tex_error && sprite_exists(global.tex[i]) {sprite_delete(global.tex[i]);}
  global.tex[i] = -1;
}
global.tex_n = 1;

//and this shit
if global.map_bkg != -1
{
  if background_exists(global.map_bkg) {background_delete(global.map_bkg);}
  global.map_bkg = -1;
  o_camera.visible = false;
}

//and this shit
if global.map_mus != -1
{
  FMODSoundFree(global.map_mus);
  global.map_mus = -1;
}

ds_list_destroy(global.cl_tiles);
global.cl_tiles = ds_list_create();

var fnum;
fnum = file_text_open_read(temp_fn);

global.map_name = file_text_read_string(fnum); file_text_readln(fnum);
global.map_desc = file_text_read_string(fnum); file_text_readln(fnum);
global.map_w = file_text_read_real(fnum); file_text_readln(fnum);
global.map_h = file_text_read_real(fnum); file_text_readln(fnum);

var _mus;
_mus = file_text_read_string(fnum); file_text_readln(fnum);
if _mus != MAP_NOMUS
{
  if file_exists(_mus)
  {
    global.map_mus = FMODSoundAdd(_mus);
    FMODSoundSetGroup(global.map_mus, 3);
  } else {
    con_add(':: MAP: ERROR: Файл музыки ' + _mus + ' не найден.');
  }
}

var _bkg;
_bkg = file_text_read_string(fnum); file_text_readln(fnum);
if _bkg != MAP_NOBKG
{
  if file_exists(_bkg)
  {
    global.map_bkg = background_add(_bkg, 0, 0);
    o_camera.visible = true;
  } else {
    con_add(':: MAP: ERROR: Текстура фона ' + _bkg + ' не найдена.');
  }
}

tx_n = file_text_read_real(fnum); file_text_readln(fnum);
for (i = 1; i < tx_n; i += 1)
{
  map_tex_load(file_text_read_string(fnum));
  file_text_readln(fnum);
}

var obj_id, ext_id, obj_x, obj_y;
while !file_text_eof(fnum)
{
  obj_id = file_text_read_real(fnum); file_text_readln(fnum);
  ext_id = file_text_read_real(fnum); file_text_readln(fnum);
  if obj_id >= 0 && obj_id <= 10
  {
    obj_x = file_text_read_real(fnum); file_text_readln(fnum);
    obj_y = file_text_read_real(fnum); file_text_readln(fnum);
    map_obj_create(obj_id, ext_id, obj_x, obj_y);
    continue;
  }
  //skipping data that we don't need
  file_text_readln(fnum);
  file_text_readln(fnum);
  if obj_id > 43 && obj_id < 49
  {
    file_text_readln(fnum);
    file_text_readln(fnum);
    if ext_id != 8
    {
      file_text_readln(fnum);
      file_text_readln(fnum);
      if ext_id != 7
      {
        file_text_readln(fnum);
        file_text_readln(fnum);
      }
    }
  }
}

file_text_close(fnum);
global.map_md5 = file_md5(temp_fn);

if !global.r_gfx {instance_deactivate_object(o_bkg);}
mus_play(global.map_mus);
con_add(':: MAP: Загружена карта ' + argument0);

