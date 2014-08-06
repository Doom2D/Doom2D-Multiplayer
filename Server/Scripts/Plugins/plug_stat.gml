// gives info about a plugin
// a0 - plugin name

with o_plugin
{
    if plug_dir == string(argument0)
    {
        var __str;
        __str = '';
        
        for (i = 0; i < 16; i += 1)
        {
            if plug_code[i] != 'void();'
            {
                __str += string(i) + "; ";
            }
        }
        
        con_add(__str);
        con_add("События: ");
        
        con_add("Тикрейт: " + string(global.sv_fps_max / plug_step));
        con_add("Описание: " + plug_name);
        con_add("Плагин: " + plug_dir);
    }
}
