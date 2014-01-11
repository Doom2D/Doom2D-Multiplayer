//creates map optimization window
if !API_Window_Exists(ui_win7) {ui_win7 = noval;}
if ui_win7 != noval {API_Window_SetFocus(ui_win7); exit;}

ui_win7 = API_Window_Create(window_handle(),
                            640, 480,
                            222, 203,
                            WS_OVERLAPPED|WS_CAPTION);
ui_win7_title = 'Удалить лишние тайлы'
API_Window_SetText(ui_win7, ui_win7_title);

API_Control_SetText( API_Button_Create(ui_win7, 4, 2, 208, 92, BS_GROUPBOX) , 'Оптимизировать:');

ui_win7_cb1 = API_Button_Create(ui_win7, 12, 20, 128, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win7_cb1, 'Тайлы окружения');

ui_win7_cb2 = API_Button_Create(ui_win7, 12, 37, 128, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win7_cb2, 'Предметы');

ui_win7_cb3 = API_Button_Create(ui_win7, 12, 54, 128, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win7_cb3, 'Области');

ui_win7_cb4 = API_Button_Create(ui_win7, 12, 71, 128, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win7_cb4, 'Триггеры');

ui_win7_cb5 = API_Button_Create(ui_win7, 6, 100, 204, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win7_cb5, 'Удалять тайлы-дубликаты');

ui_win7_cb6 = API_Button_Create(ui_win7, 6, 117, 204, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win7_cb6, 'Удалять тайлы за пределами карты');

ui_win7_b1 = API_Button_Create(ui_win7, 24, 138, 80, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win7_b1, 'Начать');

ui_win7_b2 = API_Button_Create(ui_win7, 112, 138, 80, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win7_b2, 'Закрыть');

API_Check_Set(8, ui_win7);
