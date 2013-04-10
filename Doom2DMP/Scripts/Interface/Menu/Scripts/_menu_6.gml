menu_init(global.fnt_small, c_red, 6, 17);
str[0, 0] = 'НАЧАТЬ ИГРУ';

str[1, 0] = 'Серверлист';
str[1, 1] = 'global.dem_menu = 0; if global.dem_mode == 2 {cl_disconnect(); mus_play(global.mus_menu);}; room_goto(rm_slist);';
str[1, 4] = '';

str[2, 0] = 'Запись игры';
str[2, 4] = global.dem_will;
str[2, 1] = '
    switch global.dem_will
    {
        case "НЕТ": global.dem_will = "ДА"; break;
        case "ДА": global.dem_will = "НЕТ"; break;
    }
    str[2, 4] = global.dem_will;';

str[3, 0] = 'Адрес';
str[3, 4] = string(global.sv_ip);
str[3, 1] = 'global.sv_ip = get_string("Адрес сервера: ", global.sv_ip); str[3, 4] = string(global.sv_ip);';

str[4, 0] = 'Пароль';
str[4, 4] = string(global.sv_password);
str[4, 1] = 'global.sv_password = get_string("Пароль сервера: ", global.sv_password); global.sv_password = string_delete(global.sv_password, 9, string_length(global.sv_password)); str[4, 4] = string(global.sv_password);';

str[5, 0] = 'Поехали!'
str[5, 1] = 'global.dem_menu = 0; if global.dem_mode == 2 {cl_disconnect(); mus_play(global.mus_menu);}; room_goto(rm_game);'
str[5, 4] = '';

str[6, 0] = 'Назад'
str[6, 1] = 'global.menu_id = 0; instance_create(x, y, o_menu); instance_destroy();'
str[6, 4] = '';
