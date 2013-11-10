//creates map settings window
if !API_Window_Exists(ui_win3) {ui_win3 = -1;}
if ui_win3 != -1 {API_Window_SetFocus(ui_win3); exit;}

ui_win3 = API_Window_Create(window_handle(),
                            640, 480,
                            244, 192,
                            WS_OVERLAPPED|WS_CAPTION, 0);
API_Window_SetText(ui_win3, 'Параметры карты');

var mus_s;
if global.map_mus == MAP_NOMUS {mus_s = 'Без музыки';} else {mus_s = dp_music(global.map_mus);}
ui_win3_t1 = API_Static_Create(ui_win3, 4, 6, 134, 20, SS_CENTER|SS_SUNKEN);
API_Control_SetText(ui_win3_t1, mus_s);
ui_win3_b1 = API_Button_Create(ui_win3, 144, 4, 64, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b1, 'Музыка');
ui_win3_b2 = API_Button_Create(ui_win3, 210, 4, 24, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b2, 'X');
t_new_mus = global.map_mus;

var bkg_s;
if global.map_bkg == MAP_NOBKG {bkg_s = 'Без фона';} else {bkg_s = dp_sky(global.map_bkg);}
ui_win3_t2 = API_Static_Create(ui_win3, 4, 32, 134, 20, SS_CENTER|SS_SUNKEN);
API_Control_SetText(ui_win3_t2, bkg_s);
ui_win3_b3 = API_Button_Create(ui_win3, 144, 30, 64, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b3, 'Фон');
ui_win3_b4 = API_Button_Create(ui_win3, 210, 30, 24, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b4, 'X');
t_new_bkg = global.map_bkg;

ui_win3_t3 = API_Static_Create(ui_win3, 16, 60, 52, 16, 0, 0);
API_Control_SetText(ui_win3_t3, 'Ширина:' );
ui_win3_e1 = API_Edit_Create(ui_win3, 72, 58, 40, 20, ES_NUMBER, WS_EX_CLIENTEDGE);
API_Control_SetText(ui_win3_e1, string(global.map_w));

ui_win3_t4 = API_Static_Create(ui_win3, 126, 60, 52, 16, 0, 0);
API_Control_SetText(ui_win3_t4, 'Высота:' );
ui_win3_e2 = API_Edit_Create(ui_win3, 182, 58, 40, 20, ES_NUMBER, WS_EX_CLIENTEDGE);
API_Control_SetText(ui_win3_e2, string(global.map_h));

ui_win3_e3 = API_Edit_Create(ui_win3, 4, 82, 230, 20, ES_AUTOHSCROLL, WS_EX_CLIENTEDGE);
API_Control_SetText(ui_win3_e3, global.map_name);

ui_win3_e4 = API_Edit_Create(ui_win3, 4, 106, 230, 20, ES_AUTOHSCROLL, WS_EX_CLIENTEDGE);
API_Control_SetText(ui_win3_e4, global.map_desc);

ui_win3_b5 = API_Button_Create(ui_win3, 35, 130, 80, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b5, 'OK');
ui_win3_b6 = API_Button_Create(ui_win3, 123, 130, 80, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win3_b6, 'Отмена');

API_Check_Set(4, ui_win3);
