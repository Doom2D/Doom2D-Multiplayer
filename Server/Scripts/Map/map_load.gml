//load map
//argument0 - filename
var _md5, _md5_str;
_md5 = '';
_md5_str = '';
f = 'data\maps\' + argument0 + '.dlv';
if !file_exists(f) 
{
    con_add(":: MAP ERROR: Карты " + f + " не существует.");
    sys_exit();
    exit;
}

con_add("==== MAP LOAD START ====");
con_add(":: MAP: Загрузка карты " + f + "...");

for (i = 0; i < 1024; i += 1)
{
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}
global.tex[0] = tex_none;
global.tex_n = 1;
con_add(":: MAP: TEXTURE: Creating texture array...");

file = file_text_open_read(f);
con_add(":: MAP: Reading map info...");
global.map_name = file_text_read_string(file);
file_text_readln(file);
global.map_desc = file_text_read_string(file);
file_text_readln(file);
global.map_w = file_text_read_real(file);
_md5_str += string(global.map_w);
file_text_readln(file);
global.map_h = file_text_read_real(file);
_md5_str += string(global.map_h);
file_text_readln(file);
con_add(":: MAP: Width: " + string(global.map_w) + ", height: " + string(global.map_h));
file_text_readln(file);
file_text_readln(file);
tx_n = real(file_text_read_string(file));
_md5_str += string(tx_n);
file_text_readln(file);
con_add(":: MAP: Read map info.");
for (i = 1; i < tx_n; i += 1)
{
  map_tex_load(file_text_read_string(file));
  _md5_str += file_text_read_string(file);
  file_text_readln(file);
}
while !file_text_eof(file)
{
  o_id = real(file_text_read_string(file));
  _md5_str += file_text_read_string(file);
  file_text_readln(file);
  t_id = real(file_text_read_string(file));
  _md5_str += file_text_read_string(file);
  file_text_readln(file);
  o_x = real(file_text_read_string(file));
  _md5_str += file_text_read_string(file);
  file_text_readln(file);
  o_y = real(file_text_read_string(file));
  _md5_str += file_text_read_string(file);
  file_text_readln(file);
  map_obj_create(o_id, t_id, o_x, o_y);
}
file_text_close(file);

_md5 = dll39_md5_string(_md5_str);
global.map_md5 = _md5;
_md5_str = '';
_md5 = '';

con_add(":: MAP: Created: ");
con_add(string(instance_number(o_solid)) + " wall tiles, "); 
con_add(string(instance_number(o_bkg)) + " background tiles, ");
con_add(string(instance_number(o_frg)) + " foreground tiles, ");
con_add(string(instance_number(o_water) + instance_number(o_acid)) + " liquid tiles, ");
con_add(string(instance_number(o_jthr)) + " jumpthrough tiles, ");
con_add(string(instance_number(o_lift_up) + instance_number(o_lift_down) + instance_number(o_lift_left) + instance_number(o_lift_right)) + " lifts, ");
con_add(string(instance_number(o_spawn)) +  " spawnpoints.");
con_add(":: MAP: MD5: " + string(global.map_md5));
con_add(":: MAP: Done loading.");
con_add("==== MAP  LOAD  END ====");
