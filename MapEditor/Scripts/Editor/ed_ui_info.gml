//shows the map info
if !API_Window_Exists(ui_win4) {ui_win4 = -1;}
if ui_win4 != -1 {API_Window_SetFocus(ui_win4); exit;}
ui_win4 = API_Window_Create(window_handle(), 640, 480, 155, 123, WS_OVERLAPPED|WS_CAPTION|WS_SYSMENU, 0); //156
API_Window_SetText(ui_win4, 'Статистика');
API_Window_SetIcon(ui_win4, API_Window_GetIcon(window_handle()));

ui_win4_t1 = API_Static_Create(ui_win4, 7, 7, 142, 88, 0, 0);
API_Control_SetText(ui_win4_t1, 
                    'Текстур: ' + string(global.tex_n - 1) + chr(13) + chr(10) +
                    'Тайлов окружения: ' + string(instance_number(o_solid) + 
                                                  instance_number(o_jthr) +
                                                  instance_number(o_bkg) +
                                                  instance_number(o_frg) +
                                                  instance_number(o_liquid) +
                                                  instance_number(o_lift)) + chr(13) + chr(10) +
                    'Предметов: ' + string(instance_number(o_item)) + chr(13) + chr(10) +
                    'Областей: ' + string(instance_number(o_spawn)));        

API_Check_Set (5, ui_win4);
                    
ui_if_bt = API_Button_Create(ui_win4, 6, 65, 137, 23, 0);
API_Control_SetText(ui_if_bt, 'Обновить статистику');
