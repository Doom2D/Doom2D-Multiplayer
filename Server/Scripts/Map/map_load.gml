//load map
//argument0 - filename
f = 'data\maps\' + argument0 + '.dlv';
if !file_exists(f) 
{
    con_add(":: MAP ERROR: Карты " + f + " не существует.");
    sys_exit();
    exit;
}

con_add("==== MAP LOAD START ====");
con_add(":: MAP: Загрузка карты " + f + "...");

for (i = 0; i < 256; i += 1)
{
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}



global.tex[0] = tex_none;
global.tex_n = 1;
con_add(":: MAP: TEXTURE: Создан массив под текстуры.");

file = file_text_open_read(f);
con_add(":: MAP: Читаем информацию о карте...");
global.map_name = file_text_read_string(file);
file_text_readln(file);
global.map_desc = file_text_read_string(file);
file_text_readln(file);
global.map_w = file_text_read_real(file);
file_text_readln(file);
global.map_h = file_text_read_real(file);
file_text_readln(file);
con_add(":: MAP: Ширина: " + string(global.map_w) + ", высота: " + string(global.map_h));
file_text_readln(file);
file_text_readln(file);
tx_n = real(file_text_read_string(file));
file_text_readln(file);
con_add(":: MAP: Информация прочитана.");
for (i = 1; i < tx_n; i += 1)
{
  map_tex_load(file_text_read_string(file));
  file_text_readln(file);
}
while !file_text_eof(file)
{
  o_id = real(file_text_read_string(file));
  file_text_readln(file);
  t_id = real(file_text_read_string(file));
  file_text_readln(file);
  o_x = real(file_text_read_string(file));
  file_text_readln(file);
  o_y = real(file_text_read_string(file));
  file_text_readln(file);
  map_obj_create(o_id, t_id, o_x, o_y);
}
file_text_close(file);

global.map_md5 = file_md5(f);

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
con_add(":: MAP: Карта загружена.");
con_add("==== MAP  LOAD  END ====");

cfg_load('autoexec.cfg'); //load autoexec
