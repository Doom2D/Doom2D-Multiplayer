//creates menu
ui_mbar = API_Menu_Create();

ui_mbar_m1 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m1, '&Файл');
ui_mbar_m1_create = API_Menu_AddString (ui_mbar_m1, '&Создать');
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1_open = API_Menu_AddString (ui_mbar_m1, '&Открыть');
ui_mbar_m1_save = API_Menu_AddString (ui_mbar_m1, '&Сохранить');
ui_mbar_m1_saveas = API_Menu_AddString (ui_mbar_m1, '&Сохранить как');
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1_exit = API_Menu_AddString (ui_mbar_m1, '&Выход');

ui_mbar_m2 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m2, '&Инструменты');
ui_mbar_m2_mapinfo = API_Menu_AddString (ui_mbar_m2, '&Статистика по карте');
ui_mbar_m2_deltex = API_Menu_AddString (ui_mbar_m2, '&Удалить текстуры из списка');
ui_mbar_m2_moveobj = API_Menu_AddString (ui_mbar_m2, '&Переместить объекты карты');
API_Menu_AddSeparator(ui_mbar_m2);
ui_mbar_m2_texopt = API_Menu_AddString (ui_mbar_m2, '&Удалить неиспользуемые текстуры');
ui_mbar_m2_mapopt = API_Menu_AddString (ui_mbar_m2, '&Удалить лишние тайлы');

ui_mbar_m3 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m3, '&Параметры');
ui_mbar_m3_edsets = API_Menu_AddString (ui_mbar_m3, '&Редактор');
ui_mbar_m3_mapsets = API_Menu_AddString (ui_mbar_m3, '&Карта');
API_Menu_AddSeparator(ui_mbar_m3);
ui_mbar_m3_reinit = API_Menu_AddString (ui_mbar_m3, '&Перезагрузить интерфейс');

ui_mbar_m4 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m4, '&Справка');
ui_mbar_m4_manual = API_Menu_AddString (ui_mbar_m4, '&Руководство');
ui_mbar_m4_about = API_Menu_AddString (ui_mbar_m4, '&О программе');

API_Menu_Set(window_handle(), ui_mbar);
