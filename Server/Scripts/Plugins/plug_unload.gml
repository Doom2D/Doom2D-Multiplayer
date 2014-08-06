//a0 - plugin name

with o_plugin
{
    if plug_dir != argument0 continue;
    execute_string(plug_code[PLUG_ONEND]);
    con_add(":: SYSTEM: Плагин " + plug_name + " выгружен.");
    instance_destroy();
    global.plug_num -= 1;
}
