//load map
//argument0 - filename

var temp_fn;
temp_fn = 'data\maps\' + argument0 + '.dlv';
if !file_exists(temp_fn) 
{
    con_add(":: MAP ERROR: Карты " + temp_fn + " не существует.");
    sys_exit();
    exit;
}

//load autoexec
if global.sv_autoexec > 0
{
    cfg_load('autoexec.cfg');
    if global.sv_autoexec == 2 {cfg_load('mapcfg\' + string(argument0) + '.cfg');}
}

con_add("==== MAP LOAD START ====");
con_add(":: MAP: Загрузка карты " + temp_fn + "...");

if global.mp_automode
{
    con_add(":: MAP: Определяем режим...");
    if string_lower(string_copy(argument0, 1, 2)) == 'dm'
    {
        global.mp_gamemode = 0;
    }
    if string_lower(string_copy(argument0, 1, 3)) == 'tdm'
    {
        global.mp_gamemode = 1;
    }
    if string_lower(string_copy(argument0, 1, 3)) == 'ctf'
    {
        if global.mp_automode == 1 {global.mp_gamemode = 2;} else {global.mp_gamemode = choose(1, 2);}
    }
}

var fnum;
fnum = file_text_open_read(temp_fn);
con_add(":: MAP: Читаем информацию о карте...");

global.map_name = file_text_read_string(fnum);
file_text_readln(fnum);
global.map_desc = file_text_read_string(fnum);
file_text_readln(fnum);
global.map_w = file_text_read_real(fnum);
file_text_readln(fnum);
global.map_h = file_text_read_real(fnum);
file_text_readln(fnum);
con_add(":: MAP: Размер карты: " + string(global.map_w) + "x" + string(global.map_h));
file_text_readln(fnum); //skipping music
file_text_readln(fnum); //and background
tx_n = real(file_text_read_string(fnum));
file_text_readln(fnum);
con_add(":: MAP: Информация прочитана.");

for (i = 1; i < tx_n; i += 1)
{
  map_tex_load(file_text_read_string(fnum));
  file_text_readln(fnum);
}

var obj_id, ext_id, o_x, o_y, tg_sx, tg_sy, tg_x1, tg_y1, tg_x2, tg_y2;
obj_id = -1; ext_id = -1;
o_x = -1; o_y = -1;
tg_sx = 0; tg_sy = 0;
tg_x1 = 0; tg_y1 = 0;
tg_x2 = 0; tg_y2 = 0;

while !file_text_eof(fnum)
{
  obj_id = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  ext_id = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  o_x = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  o_y = real(file_text_read_string(fnum));
  file_text_readln(fnum);
  if obj_id > 43 && obj_id < 49
  {
    tg_sx = real(file_text_read_string(fnum));
    file_text_readln(fnum);
    tg_sy = real(file_text_read_string(fnum));
    file_text_readln(fnum);
    if ext_id != 8
    {
      tg_x1 = real(file_text_read_string(fnum));
      file_text_readln(fnum);
      tg_y1 = real(file_text_read_string(fnum));
      file_text_readln(fnum);
      if ext_id != 7
      {
        tg_x2 = real(file_text_read_string(fnum));
        file_text_readln(fnum);
        tg_y2 = real(file_text_read_string(fnum));
        file_text_readln(fnum);
      }
    }
  }
  map_obj_create(obj_id, ext_id, o_x, o_y, tg_sx, tg_sy, tg_x1, tg_y1, tg_x2, tg_y2);
}

file_text_close(fnum);
global.map_md5 = file_md5(temp_fn);

con_add(":: MAP: Создано: ");
con_add(string(instance_number(o_solid)) + " тайлов-стен, "); 
con_add(string(instance_number(o_water) + instance_number(o_acid)) + " тайлов жидкости, ");
con_add(string(instance_number(o_jthr)) + " тайлов-ступеней, ");
con_add(string(instance_number(o_lift_up) + instance_number(o_lift_down) + instance_number(o_lift_left) + instance_number(o_lift_right)) + " тайлов-лифтов, ");
con_add(string(instance_number(o_spawn)) +  " точек респауна.");
con_add(":: MAP: MD5: " + string(global.map_md5));
if instance_number(o_spawn) < 1 
{
    con_add(":: MAP: ERROR: На карте нет точек респауна. Она не будет работать.");
    sys_exit();
    exit;
}
if global.mp_gamemode == 2 && !flag_check()
{
    con_add(":: MAP: ERROR: На карте нет флагов. Включен TDM.");
    global.mp_gamemode = 1;
}
con_add(":: MAP: Карта загружена.");
con_add("===== MAP LOAD END =====");
