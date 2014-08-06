//creates map navigation window
if !API_Window_Exists(ui_win9) {ui_win9 = noval;}
if ui_win9 != noval {API_Window_SetFocus(ui_win9); exit;}

ui_win9 = API_Window_Create(window_handle(),
                            640, 480,
                            round(global.map_w / 16), round(global.map_h / 16),
                            WS_POPUP|WS_SIZEBOX);
API_Window_SetText(ui_win9, 'Навигатор');

ui_win9_bkg = API_Static_Create(ui_win9, 0, 0, 100, 100, 0, 0);
API_Styling_SetBackColor(ui_win9_bkg, c_navy);

API_Check_Set(10, ui_win9);

//API_Draw_Gradient( API_Window_GetDC(ui_win9), 0, 0, 30, 30, 1, c_lime, c_red );
API_Window_SetBrush(ui_win9, API_Draw_CreateSolidBrush(c_lime) );
