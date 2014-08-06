menu_init(global.fnt_big, c_white, 4, 30);
str[0, 0] = 'МЕНЮ';

str[1, 0] = 'Назад в игру';
str[1, 1] = 'global.menu_id = 7; keyboard_clear(vk_escape); io_clear(); instance_destroy();';

str[2, 0] = 'Настройки';
str[2, 1] = 'global.menu_id = 1; instance_create(x, y, o_menu); instance_destroy();';

str[3, 0] = 'Главное меню';
str[3, 1] = 'global.menu_id = 0; ( instance_create(0, 0, o_exit) ).ingame = true; instance_destroy();';

str[4, 0] = 'Назад в игру';
str[4, 1] = 'global.menu_id = 7; instance_destroy();';
