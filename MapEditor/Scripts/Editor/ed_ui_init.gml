//inits ui
API_Check_Set (1, window_handle());
//menubar
ui_mbar = API_Menu_Create();
ui_mbar_m1 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar,ui_mbar_m1,"&Файл");
ui_mbar_m1n = API_Menu_AddString (ui_mbar_m1, "&Создать");
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1o = API_Menu_AddString (ui_mbar_m1, "&Открыть");
ui_mbar_m1s = API_Menu_AddString (ui_mbar_m1, "&Сохранить как");
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1q = API_Menu_AddString (ui_mbar_m1, "&Выход");
ui_mbar_m2 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar,ui_mbar_m2,"&Параметры");
ui_mbar_m2e = API_Menu_AddString (ui_mbar_m2, "&Редактор");
ui_mbar_m2m = API_Menu_AddString (ui_mbar_m2, "&Карта");
ui_mbar_m2r = API_Menu_AddString (ui_mbar_m2, "&Перезагрузить интерфейс");
ui_mbar_m3 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar,ui_mbar_m3,"&Справка");
ui_mbar_m3i = API_Menu_AddString (ui_mbar_m3, "&Статистика по карте");
ui_mbar_m3m = API_Menu_AddString (ui_mbar_m3, "&Руководство");
ui_mbar_m3a = API_Menu_AddString (ui_mbar_m3, "&О программе");
API_Menu_Set(window_handle(), ui_mbar);

ui_win1 = -1;
ui_win2 = -1;
ui_win3 = -1;
ui_win4 = -1;
ui_if_bt = -1;
ed_tbox_init();
