//creates objects moving window
if !API_Window_Exists(ui_win6) {ui_win6 = noval;}
if ui_win6 != noval {API_Window_SetFocus(ui_win6); exit;}

ui_win6 = API_Window_Create(window_handle(),
                            640, 480,
                            284, 122,
                            WS_OVERLAPPED|WS_CAPTION);
ui_win6_title = 'Переместить объекты карты';
API_Window_SetText(ui_win6, ui_win6_title);

create_text(ui_win6, 8, 12, 120, 16, 'Относительно оси X:');
ui_win6_e1 = API_Edit_Create(ui_win6, 120, 8, 32, 20, ES_NUMBER, WS_EX_CLIENTEDGE);
API_Control_SetText(ui_win6_e1, '0');
ui_win6_rb1 = API_Button_Create(ui_win6, 160, 11, 56, 16, BS_AUTORADIOBUTTON|WS_GROUP);
API_Control_SetText(ui_win6_rb1, 'Вперед');
ui_win6_rb2 = API_Button_Create(ui_win6, 222, 11, 56, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win6_rb2, 'Назад');

create_text(ui_win6, 8, 36, 120, 16, 'Относительно оси Y:');
ui_win6_e2 = API_Edit_Create(ui_win6, 120, 32, 32, 20, ES_NUMBER, WS_EX_CLIENTEDGE);
API_Control_SetText(ui_win6_e2, '0');
ui_win6_rb3 = API_Button_Create(ui_win6, 160, 35, 56, 16, BS_AUTORADIOBUTTON|WS_GROUP);
API_Control_SetText(ui_win6_rb3, 'Вперед');
ui_win6_rb4 = API_Button_Create(ui_win6, 222, 35, 56, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win6_rb4, 'Назад');

ui_win6_b1 = API_Button_Create(ui_win6, 70, 58, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win6_b1, 'Переместить');

ui_win6_b2 = API_Button_Create(ui_win6, 174, 58, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win6_b2, 'Закрыть');

API_Button_SetCheck(ui_win6_rb1, true);
API_Button_SetCheck(ui_win6_rb3, true);

API_Check_Set(7, ui_win6);
