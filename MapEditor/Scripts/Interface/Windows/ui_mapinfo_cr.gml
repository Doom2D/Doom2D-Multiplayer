//creates map information window
if !API_Window_Exists(ui_win4) {ui_win4 = noval;}
if ui_win4 != noval {API_Window_SetFocus(ui_win4); exit;}

ui_win4 = API_Window_Create(window_handle(),
                            640, 480,
                            155, 137,
                            WS_OVERLAPPED|WS_CAPTION|WS_SYSMENU);
API_Window_SetText(ui_win4, 'Статистика');
API_Window_SetIcon( ui_win4, API_Window_GetIcon( window_handle() ) );

ui_win4_t1 = API_Static_Create(ui_win4, 7, 7, 142, 88);
ui_win4_bt = API_Button_Create(ui_win4, 6, 78, 137, 23);
ui_mapinfo_set();

API_Check_Set(5, ui_win4);
