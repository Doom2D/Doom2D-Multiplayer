menu_init(global.fnt_big, c_white, 6, 30);
if global.dem_will == 'PLAY' {global.dem_will = 'НЕТ';}
str[0, 0] = 'МЕНЮ';
str[1, 0] = 'Начать игру';
str[1, 1] = 'if global.dem_mode == 2 {cl_disconnect(); mus_play(global.mus_menu); room_goto(rm_menu);}; global.menu_id = 6; instance_create(x, y, o_menu); instance_destroy();';
str[2, 0] = 'Записи';
str[2, 1] = 'global.dem_fn = path_relative(get_open_filename("Записи геймплея Doom2DMP 0.6 (*.DGP)|*.dgp", "demos\*.dgp")); if !file_exists(global.dem_fn) {exit;}; global.dem_menu = 0; global.menu_id = 0; global.dem_will = "PLAY"; room_goto(rm_game);';
str[3, 0] = 'Настройки';
str[3, 1] = 'global.menu_id = 1; instance_create(x, y, o_menu); instance_destroy();';
str[4, 0] = 'Авторы';
str[4, 1] = 'if global.dem_mode == 2 {cl_disconnect();}; room_goto(rm_credits);';
str[5, 0] = 'Выход';
str[5, 1] = 'global.menu_id = 0; instance_create(x, y, o_exit); instance_destroy();';
str[6, 0] = 'Выход';
str[6, 1] = 'global.menu_id = 0; instance_create(x, y, o_exit); instance_destroy();';

