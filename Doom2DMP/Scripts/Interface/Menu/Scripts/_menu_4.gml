menu_init(global.fnt_small, c_red, 14, 17);

str[0, 0] = 'ВИДЕО';
str[0, 4] = '';

str[1, 0] = 'В окне';
if global.r_window {str[1, 4] = 'ДА';} else {str[1, 4] = 'НЕТ';}

str[1, 1] = "if room != rm_menu {exit;}
    if global.r_window
    {
        global.r_window = 0;
        str[1, 4] = 'НЕТ';
    } else {
        global.r_window = 1;
        str[1, 4] = 'ДА';
    }";

str[2, 0] = 'Спецэффекты';
if global.r_gfx {str[2, 4] = 'ДА';} else {str[2, 4] = 'НЕТ';}
str[2, 1] = 'if global.r_gfx {global.r_gfx = 0; str[2, 4] = "НЕТ";} else {global.r_gfx = 1; str[2, 4] = "ДА";};';

str[3, 0] = 'Уровень насилия';
str[3, 4] = string(global.r_massacre);
str[3, 1] = '
    global.r_massacre += 1;
    if global.r_massacre > 3 {global.r_massacre = 0;}
    str[3, 4] = string(global.r_massacre);';

str[4, 0] = 'Отображать имена';
if global.r_names {str[4, 4] = 'ДА';} else {str[4, 4] = 'НЕТ';}
str[4, 1] = 'if global.r_names {global.r_names = 0; str[4, 4] = "НЕТ";} else {global.r_names = 1; str[4, 4] = "ДА";};';

str[5, 0] = 'Комментарии';
if global.r_announcer {str[5, 4] = 'ДА';} else {str[5, 4] = 'НЕТ';}
str[5, 1] = 'if global.r_announcer {global.r_announcer = 0; str[5, 4] = "НЕТ";} else {global.r_announcer = 1; str[5, 4] = "ДА";};';

str[6, 0] = 'Вспышки экрана';
if global.r_flash {str[6, 4] = 'ДА';} else {str[6, 4] = 'НЕТ';}
str[6, 1] = 'if global.r_flash {con_parse("r_flash 0"); str[6, 4] = "НЕТ";} else  {con_parse("r_flash 1"); str[6, 4] = "ДА";}';

str[7, 0] = 'Отображать HUD';
if global.r_drawhud {str[7, 4] = 'ДА';} else {str[7, 4] = 'НЕТ';}
str[7, 1] = 'if global.r_drawhud {global.r_drawhud = 0; str[7, 4] = "НЕТ";} else {global.r_drawhud = 1; str[7, 4] = "ДА";};';

str[8, 0] = 'Frameskip';
if global.r_fskip {str[8, 4] = 'ДА';} else {str[8, 4] = 'НЕТ';}
str[8, 1] = 'if global.r_fskip {global.r_fskip = 0; str[8, 4] = "НЕТ";} else {global.r_fskip = 1; str[8, 4] = "ДА";};';

str[9, 0] = 'Коррекция FPS';
if global.r_fps_correct {str[9, 4] = 'ДА';} else {str[9, 4] = 'НЕТ';}
str[9, 1] = 'if global.r_fps_correct {global.r_fps_correct = 0; str[9, 4] = "НЕТ";} else {global.r_fps_correct = 1; str[9, 4] = "ДА";};';

str[10, 0] = 'Масштабирование';
if global.r_scale {str[10, 4] = 'ДА';} else {str[10, 4] = 'НЕТ';}
str[10, 1] = 'if global.r_scale {global.r_scale = 0; str[10, 4] = "НЕТ";} else {global.r_scale = 1; str[10, 4] = "ДА";};';

str[11, 0] = 'Разрешение';
str[11, 4] = string(global.r_width) + 'x' + string(global.r_height);
str[11, 1] = "if room != rm_menu {exit;}
    switch global.r_width
    {
        case 640:
            global.r_width = 800;
            global.r_height = 600;
        break;
        case 800:
            global.r_width = 1024;
            global.r_height = 768;
        break;
        case 1024:
            global.r_width = 1280;
            global.r_height = 1024;
        break;
        case 1280:
            global.r_width = 1600;
            global.r_height = 1200;
        break;
        case 1600:
            global.r_width = 640;
            global.r_height = 480;
        break;
    }
    str[11, 4] = string(global.r_width) + 'x' + string(global.r_height);";
str[11, 2] = "if room != rm_menu {exit;}
    switch global.r_width
    {
        case 640:
            global.r_width = 800;
            global.r_height = 600;
        break;
        case 800:
            global.r_width = 1024;
            global.r_height = 768;
        break;
        case 1024:
            global.r_width = 1280;
            global.r_height = 1024;
        break;
        case 1280:
            global.r_width = 1600;
            global.r_height = 1200;
        break;
        case 1600:
            global.r_width = 640;
            global.r_height = 480;
        break;
    }
    str[11, 4] = string(global.r_width) + 'x' + string(global.r_height);";
str[11, 3] = "if room != rm_menu {exit;}
    switch global.r_width
    {
        case 1600:
            global.r_width = 1280;
            global.r_height = 1024;
        break;
        case 1280:
            global.r_width = 1024;
            global.r_height = 768;
        break;
        case 1024:
            global.r_width = 800;
            global.r_height = 600;
        break;
        case 800:
            global.r_width = 640;
            global.r_height = 480;
        break;
        case 640:
            global.r_width = 1600;
            global.r_height = 1200;
        break;
    }
    str[11, 4] = string(global.r_width) + 'x' + string(global.r_height);";

str[12, 0] = 'Глубина цвета';
str[12, 4] = string(global.r_depth);
str[12, 1] = 'if global.r_depth == 16 {con_parse("r_depth 32");} else {con_parse("r_depth 16");}; str[12, 4] = string(global.r_depth);';    
    
str[13, 0] = 'Синхронизация';
if !global.r_vsync {str[13, 4] = 'НЕТ';} else {str[13, 4] = 'ДА';}
str[13, 1] = 'if global.r_vsync {con_parse("r_vsync 0"); str[13, 4] = "НЕТ";} else {con_parse("r_vsync 1"); str[13, 4] = "ДА";};';

str[14, 0] = 'Назад';
str[14, 1] = 'r_screenset(); global.menu_id = 1; instance_create(x, y, o_menu); instance_destroy();';
str[14, 4] = '';
