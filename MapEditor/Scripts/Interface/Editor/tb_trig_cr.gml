//creates list of the triggers at the toolbox window
ui_tg_txt = API_Static_Create(ui_win1, 8, 92, 100, 12, 0, 0);
API_Control_SetText(ui_tg_txt, 'Триггер');
ui_tg_cb = API_Combobox_Create(ui_win1, 8, 108, 200, 20, CBS_HASSTRINGS|CBS_DROPDOWNLIST|WS_VSCROLL, 0);

API_Combobox_AddString(ui_tg_cb, 'Включить стену'); //0
API_Combobox_AddString(ui_tg_cb, 'Выключить стену'); //1
API_Combobox_AddString(ui_tg_cb, 'Переключить стену'); //2
API_Combobox_AddString(ui_tg_cb, 'Случайный расширитель'); //3
API_Combobox_AddString(ui_tg_cb, 'Расширитель'); //4
API_Combobox_AddString(ui_tg_cb, 'Переключить триггер'); //5
API_Combobox_AddString(ui_tg_cb, 'Убить игрока'); //6
API_Combobox_AddString(ui_tg_cb, 'Телепорт'); //7
API_Combobox_AddString(ui_tg_cb, 'Завершить раунд'); //8
API_Combobox_SetSel(ui_tg_cb, 0);
