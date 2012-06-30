//show editor settings window
if !API_Window_Exists(ui_win2) {ui_win2 = -1;}
if ui_win2 != -1 {exit;}
ui_win2 = API_Window_Create(window_handle(), 640, 480, 240, 128, WS_OVERLAPPED|WS_CAPTION, 0);
API_Window_SetText(ui_win2, 'Настройки редактора');
ui_win2_b1 = API_Button_Create(ui_win2, 4, 8, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win2_b1, "Цвет фона");
ui_win2_rb1 = API_Button_Create(ui_win2, 112, 8, 96, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win2_rb1, "Сетка 16x16");
ui_win2_rb2 = API_Button_Create(ui_win2, 112, 24, 96, 16, BS_AUTORADIOBUTTON);
API_Control_SetText(ui_win2_rb2, "Сетка 8x8");
ui_win2_cb1 = API_Button_Create(ui_win2, 112, 48, 96, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win2_cb1, "Показать сетку");
ui_win2_cb2 = API_Button_Create(ui_win2, 112, 64, 130, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win2_cb2, "Привязка к сетке");
ui_win2_b2 = API_Button_Create(ui_win2, 4, 48, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win2_b2, "Закрыть");
ui_win2_cb3 = API_Button_Create(ui_win2, 112, 80, 96, 16, BS_AUTOCHECKBOX);
API_Control_SetText(ui_win2_cb3, "Контуры");

if global.ed_g_sz == 16
{
    API_Button_SetCheck(ui_win2_rb1, true);
    API_Button_SetCheck(ui_win2_rb2, false);
}
else
{
    API_Button_SetCheck(ui_win2_rb1, false);
    API_Button_SetCheck(ui_win2_rb2, true);
}


API_Button_SetCheck(ui_win2_cb1, global.ed_g_vis);
API_Button_SetCheck(ui_win2_cb2, global.ed_g_use);

API_Button_SetCheck(ui_win2_cb3, global.ed_outline);

API_Check_Set (3, ui_win2);
