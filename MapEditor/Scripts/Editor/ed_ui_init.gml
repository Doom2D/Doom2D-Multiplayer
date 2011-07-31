//inits ui
API_Check_Set (1, window_handle());
//menubar
ui_mbar = API_Menu_Create();
ui_mbar_m1 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar,ui_mbar_m1,"&Файл");
ui_mbar_m1n = API_Menu_AddString (ui_mbar_m1, "&Создать");
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1o = API_Menu_AddString (ui_mbar_m1, "&Открыть");
ui_mbar_m1s = API_Menu_AddString (ui_mbar_m1, "&Сохранить");
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1q = API_Menu_AddString (ui_mbar_m1, "&Выход");
ui_mbar_m2 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar,ui_mbar_m2,"&Параметры");
ui_mbar_m2e = API_Menu_AddString (ui_mbar_m2, "&Редактор");
ui_mbar_m2m = API_Menu_AddString (ui_mbar_m2, "&Карта");
ui_mbar_m3 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar,ui_mbar_m3,"&Справка");
ui_mbar_m3a = API_Menu_AddString (ui_mbar_m3, "&О программе");
API_Menu_Set(window_handle(), ui_mbar);

//toolbox
ui_win1 = API_Window_Create(window_handle(), window_get_x() + 200, window_get_y() + 44, 196, 128, WS_OVERLAPPED|WS_CAPTION, 0);
API_Check_Set (2, ui_win1);

API_Window_SetText(ui_win1, 'Инструменты');
ed_ui_tiles(); //add tile cb
ed_ui_tex(); //add texture cb
