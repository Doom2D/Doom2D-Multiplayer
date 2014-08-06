menu_init(global.fnt_small, c_red, 14, 17);
str[0, 0] = 'УПРАВЛЕНИЕ';
str[1, 0] = 'Вверх'
str[1, 1] = 'str[1, 4] = "<...>"; key_bind2("+lookup"); str[1, 4] = key_name(global.key_up);';
str[1, 4] =  key_name(global.key_up);

str[2, 0] = 'Вниз'
str[2, 1] = "str[2, 4] = '<...>'; key_bind2('+lookdown'); str[2, 4] = key_name(global.key_dn);";
str[2, 4] = key_name(global.key_dn);

str[3, 0] = 'Влево'
str[3, 1] = "str[3, 4] = '<...>'; key_bind2('+left'); str[3, 4] = key_name(global.key_left);";
str[3, 4] = key_name(global.key_left);

str[4, 0] = 'Вправо'
str[4, 1] = "str[4, 4] = '<...>'; key_bind2('+right'); str[4, 4] = key_name(global.key_right);";
str[4, 4] = key_name(global.key_right);

str[5, 0] = 'Огонь';
str[5, 1] = "str[5, 4] = '<...>'; key_bind2('+attack'); str[5, 4] = key_name(global.key_atk);";
str[5, 4] = key_name(global.key_atk);

str[6, 0] = 'Прыжок'
str[6, 1] = "str[6, 4] = '<...>'; key_bind2('+jump'); str[6, 4] = key_name(global.key_jmp);";
str[6, 4] = key_name(global.key_jmp);

str[7, 0] = 'Использовать'
str[7, 1] = "str[7, 4] = '<...>'; key_bind2('+use'); str[7, 4] = key_name(global.key_use);";
str[7, 4] = key_name(global.key_use);

str[8, 0] = 'Чат'
str[8, 1] = "str[8, 4] = '<...>'; key_bind2('+chat'); str[8, 4] = key_name(global.key_chat);";
str[8, 4] = key_name(global.key_chat);

str[9, 0] = 'След. оружие'
str[9, 1] = "str[9, 4] = '<...>'; key_bind2('+nextweapon'); str[9, 4] = key_name(global.key_chw);";
str[9, 4] = key_name(global.key_chw);

str[10, 0] = 'Пред. оружие'
str[10, 1] = "str[10, 4] = '<...>'; key_bind2('+prevweapon'); str[10, 4] = key_name(global.key_chw2);";
str[10, 4] = key_name(global.key_chw2);

str[11, 0] = 'Выбросить флаг'
str[11, 1] = "str[11, 4] = '<...>'; key_bind2('+dropflag'); str[11, 4] = key_name(global.key_drop);";
str[11, 4] = key_name(global.key_drop);

str[12, 0] = 'Сменить команду'
str[12, 1] = "str[12, 4] = '<...>'; key_bind2('+changeteam'); str[12, 4] = key_name(global.key_chteam);";
str[12, 4] = key_name(global.key_chteam);

str[13, 0] = 'Скриншот'
str[13, 1] = "str[13, 4] = '<...>'; key_bind2('+screenshot'); str[13, 4] = key_name(global.key_scr);";
str[13, 4] = key_name(global.key_scr);

str[14, 0] = 'Назад'
str[14, 1] = 'global.menu_id = 1; instance_create(x, y, o_menu); instance_destroy();';
str[14, 4] = '';
