//show editor settings window
ui_win2 = API_Window_Create(window_handle(), 640, 480, 220, 128, WS_OVERLAPPED|WS_CAPTION, 0);
API_Window_SetText(ui_win2, 'Настройки редактора');
ui_win2_b1 = API_Button_Create(ui_win2, 4, 8, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win2_b1, "Цвет фона");
ui_win2_rb1 = API_Button_Create(ui_win2, 112, 8, 96, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win2_rb1, "Сетка 16x16");
ui_win2_rb2 = API_Button_Create(ui_win2, 112, 32, 96, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win2_rb2, "Сетка 8x8");
ui_win2_rb3 = API_Button_Create(ui_win2, 112, 56, 96, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win2_rb3, "Без сетки");
ui_win2_b2 = API_Button_Create(ui_win2, 4, 48, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win2_b2, "Закрыть");
ui_win2_cb1 = API_Button_Create(ui_win2, 112, 80, 96, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win2_cb1, "Контуры");

if global.ed_g_sz == 16
{
    API_Button_SetCheck(ui_win2_rb1, true);
    API_Button_SetCheck(ui_win2_rb2, false);
    API_Button_SetCheck(ui_win2_rb3, false);
}
else
{
    API_Button_SetCheck(ui_win2_rb1, false);
    API_Button_SetCheck(ui_win2_rb2, true);
    API_Button_SetCheck(ui_win2_rb3, false);
}

if global.ed_g_vis == false
{
    API_Button_SetCheck(ui_win2_rb1, false);
    API_Button_SetCheck(ui_win2_rb2, false);
    API_Button_SetCheck(ui_win2_rb3, true);
}

if global.ed_outline
{
    API_Button_SetCheck(ui_win2_cb1, true);
}
else
{
    API_Button_SetCheck(ui_win2_cb1, false);
}

API_Check_Set (3, ui_win2);
