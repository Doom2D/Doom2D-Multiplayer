//loads a plugin
//argument0 - plugin name

if !global.sv_plugins
{
    con_add(":: SYSTEM: WARNING: Плагины выключены.");
    exit;
}

var pn, fn, f, pinst;
pn = string(argument0);
fn = 'data\plugins\' + pn + '\info.gml';
if !file_exists(fn)
{
    con_add(":: SYSTEM: ERROR: Плагин не существует: " + pn);
    exit;
}

with o_plugin
{
    if plug_dir == pn
    {
        con_add(":: SYSTEM: ERROR: Плагин " + pn + " уже загружен (" + string(id) + ").");
        exit;
    }
}

pinst = instance_create(0, 0, o_plugin);

with pinst
{
    bar = '';
    plug_name = "UNNAMEDPLUG";
    plug_step = global.sv_fps_max;
    plug_file = fn;
    plug_dir = pn;

    for (i = 0; i < 16; i += 1) plug_code[i] = 'void();';

    plug_load_info();
    
    con_add(":: SYSTEM: Загружен плагин " + pn + " (" + plug_name + ") из файла " + fn + ".");
    
    plug_exec(PLUG_ONSTART);
}

global.plug_num += 1;

