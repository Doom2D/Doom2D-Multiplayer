menu_init(global.fnt_small, c_red, 5, 17);
if room == rm_menu {instance_create(0, 0, o_dummy);}

str[0, 0] = 'ИГРОК';

str[1, 0] = 'Имя';
str[1, 4] = string(global.pl_name);
str[1, 1] = 'con_parse("name " + get_string("Новое имя: ", global.pl_name)); str[1, 4] = global.pl_name;';

str[2, 0] = 'Цвет';
str[2, 1] = 'var color_temp; color_temp = get_color(global.pl_color); if color_temp != -1 {global.pl_color = color_temp;}; if room == rm_menu {with(o_dummy){instance_destroy();}; instance_create(0, 0, o_dummy);};';

str[3, 0] = 'Скин';
str[3, 1] = 'con_parse("skin " + string_replace(string_replace(get_open_filename("INFO|INFO", "data\skins\doomer\INFO"), working_directory + "\data\skins\", ""), "\INFO", "")); if room == rm_menu {with(o_dummy){instance_destroy();}; instance_create(0, 0, o_dummy);}';

str[4, 0] = 'Команда';
if global.pl_team == 1 {str[4, 4] = 'Красная';} else {str[4, 4] = 'Синяя';}
str[4, 1] = 'if global.pl_team == 1 {con_parse("team 2"); str[4, 4] = "Синяя";} else  {con_parse("team 1"); str[4, 4] = "Красная";}';

str[5, 0] = 'Назад';
str[5, 1] = 'global.menu_id = 1; instance_create(x, y, o_menu); instance_destroy();';

