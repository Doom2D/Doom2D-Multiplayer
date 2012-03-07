//show map settings window
ui_win3 = API_Window_Create(window_handle(), 640, 480, 172, 205, WS_OVERLAPPED|WS_CAPTION, 0);
API_Window_SetText(ui_win3, 'Параметры карты');

ui_win3_b1 = API_Button_Create(ui_win3, 100, 4, 64, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b1, "Музыка");
ui_win3_b2 = API_Button_Create(ui_win3, 100, 28, 64, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b2, "Фон");
ui_win3_e1 = API_Edit_Create(ui_win3, 100, 55, 64, 20, ES_NUMBER|WS_DLGFRAME);
API_Control_SetText(ui_win3_e1, string(global.map_w));
ui_win3_e2 = API_Edit_Create(ui_win3, 100, 75, 64, 20, ES_NUMBER|WS_DLGFRAME);
API_Control_SetText(ui_win3_e2, string(global.map_h));
ui_win3_e3 = API_Edit_Create(ui_win3, 4, 97, 160, 20, ES_AUTOHSCROLL|WS_DLGFRAME);
API_Control_SetText(ui_win3_e3, global.map_name);
ui_win3_e4 = API_Edit_Create(ui_win3, 4, 117, 160, 20, ES_AUTOHSCROLL|WS_DLGFRAME);
API_Control_SetText(ui_win3_e4, global.map_desc);
ui_win3_b3 = API_Button_Create(ui_win3, 48, 147, 68, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b3, "Сохранить");

ui_win3_t1 = API_Static_Create(ui_win3, 4, 8, 96, 16, 0, 0);
API_Control_SetText(ui_win3_t1, string_replace(global.map_mus, "data\music\", ""));

ui_win3_t2 = API_Static_Create(ui_win3, 4, 32, 96, 16, 0, 0);
API_Control_SetText(ui_win3_t2, string_replace(global.map_bkg, "data\sky\", ""));

ui_win3_t3 = API_Static_Create(ui_win3, 4, 58, 96, 16, 0, 0);
API_Control_SetText(ui_win3_t3, "Ширина:" );

ui_win3_t4 = API_Static_Create(ui_win3, 4, 78, 96, 16, 0, 0);
API_Control_SetText(ui_win3_t4, "Высота:" );

API_Check_Set (4, ui_win3);
