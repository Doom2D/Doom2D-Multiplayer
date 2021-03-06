//creates textures deleting window
if !API_Window_Exists(ui_win5) {ui_win5 = noval;}
if ui_win5 != noval {API_Window_SetFocus(ui_win5); exit;}

ui_win5 = API_Window_Create(window_handle(),
                            640, 480,
                            240, 292,
                            WS_OVERLAPPED|WS_CAPTION);
API_Window_SetText(ui_win5, 'Удалить текстуры из списка');

ui_win5_lb1 = API_Listbox_Create(ui_win5, 8, 8, 218, 212,
                                 WS_VSCROLL|LBS_EXTENDEDSEL|LBS_HASSTRINGS|LBS_DISABLENOSCROLL,
                                 WS_EX_CLIENTEDGE);

for (i = 1; i < global.tex_n; i += 1)
{
  API_Listbox_AddString(ui_win5_lb1, get_tex_str(i));
}

ui_win5_b1 = API_Button_Create(ui_win5, 18, 228, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win5_b1, 'Удалить');

ui_win5_b2 = API_Button_Create(ui_win5, 120, 228, 96, 24, BS_PUSHBUTTON);
API_Control_SetText(ui_win5_b2, 'Закрыть');

API_Check_Set(6, ui_win5);
