API_Window_Destroy(ui_win1);
ui_win1 = API_Window_Create(window_handle(), window_get_x(), window_get_y(), 196, 128, WS_OVERLAPPED|WS_CAPTION, 0);
API_Window_SetText(ui_win1, 'Инструменты');
API_Check_Set (2, ui_win1);
ed_ui_tiles(); //add tile cb
ed_ui_tex(); //add texture cb
