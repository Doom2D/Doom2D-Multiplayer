//creates objects mirroring window
if !API_Window_Exists(ui_win8) {ui_win8 = -1;}
if ui_win8 != -1 {API_Window_SetFocus(ui_win8); exit;}

ui_win8 = API_Window_Create(window_handle(),
                            640, 480,
                            178, 146,
                            WS_OVERLAPPED|WS_CAPTION);
ui_win8_title = 'Отразить объекты карты';
API_Window_SetText(ui_win8, ui_win8_title);

ui_win8_cb1 = API_Button_Create(ui_win8, 6, 6, 160, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win8_cb1, 'Отразить по горизонтали');
ui_win8_cb2 = API_Button_Create(ui_win8, 6, 23, 160, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win8_cb2, 'Отразить по вертикали');

ui_win8_rb1 = API_Button_Create(ui_win8, 6, 44, 160, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win8_rb1, 'Отразить существующие');
ui_win8_rb2 = API_Button_Create(ui_win8, 6, 61, 160, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win8_rb2, 'Дублировать и отразить');

ui_win8_b1 = API_Button_Create(ui_win8, 12, 82, 70, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win8_b1, 'Отразить');
ui_win8_b2 = API_Button_Create(ui_win8, 90, 82, 70, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win8_b2, 'Закрыть');

API_Button_SetCheck(ui_win8_rb1, true);

API_Check_Set(9, ui_win8);
