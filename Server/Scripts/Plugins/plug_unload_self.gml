execute_string(plug_code[PLUG_ONEND]);
con_add(":: SYSTEM: Плагин " + plug_name + " выгружен.");
instance_destroy();
global.plug_num -= 1;
