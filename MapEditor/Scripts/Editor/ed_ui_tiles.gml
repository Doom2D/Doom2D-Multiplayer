//tile listbox
ui_tl_txt = API_Static_Create(ui_win1, 8, 4, 64, 12, 0, 0);
API_Control_SetText(ui_tl_txt, 'Тайлы:');
ui_tl_cb = API_Combobox_Create(ui_win1, 8, 20, 144, 20, CBS_HASSTRINGS|CBS_DROPDOWNLIST|WS_VSCROLL, 0);

//strings//
//tiles
API_Combobox_AddString(ui_tl_cb, 'Стена'); //0
API_Combobox_AddString(ui_tl_cb, 'Ступень');
API_Combobox_AddString(ui_tl_cb, 'Фон');
API_Combobox_AddString(ui_tl_cb, 'Передний план');
API_Combobox_AddString(ui_tl_cb, 'Вода'); //4
API_Combobox_AddString(ui_tl_cb, 'Кислота 1');
API_Combobox_AddString(ui_tl_cb, 'Кислота 2');
API_Combobox_AddString(ui_tl_cb, 'Лифт вверх');
API_Combobox_AddString(ui_tl_cb, 'Лифт вниз');
API_Combobox_AddString(ui_tl_cb, 'Лифт влево'); //9
API_Combobox_AddString(ui_tl_cb, 'Лифт вправо');
API_Combobox_AddString(ui_tl_cb, 'Аптечка');
API_Combobox_AddString(ui_tl_cb, 'Большая аптечка');
API_Combobox_AddString(ui_tl_cb, 'Зеленая броня');
API_Combobox_AddString(ui_tl_cb, 'Синяя броня'); //14
API_Combobox_AddString(ui_tl_cb, 'Соулсфера');
API_Combobox_AddString(ui_tl_cb, 'Мегасфера');
API_Combobox_AddString(ui_tl_cb, 'Неуязвимость');
API_Combobox_AddString(ui_tl_cb, 'Джетпак');
API_Combobox_AddString(ui_tl_cb, 'Берсерк'); //19
API_Combobox_AddString(ui_tl_cb, 'Рюкзак');
API_Combobox_AddString(ui_tl_cb, 'Обойма');
API_Combobox_AddString(ui_tl_cb, 'Коробка патронов');
API_Combobox_AddString(ui_tl_cb, '4 гильзы');
API_Combobox_AddString(ui_tl_cb, '12 гильз'); //24
API_Combobox_AddString(ui_tl_cb, '1 граната');
API_Combobox_AddString(ui_tl_cb, '10 гранат');
API_Combobox_AddString(ui_tl_cb, '1 ракета');
API_Combobox_AddString(ui_tl_cb, '5 ракет');
API_Combobox_AddString(ui_tl_cb, 'Батарейка');
API_Combobox_AddString(ui_tl_cb, 'Батарея');
API_Combobox_AddString(ui_tl_cb, 'Ружье'); //31
API_Combobox_AddString(ui_tl_cb, 'Двустволка');
API_Combobox_AddString(ui_tl_cb, 'Пулемет');
API_Combobox_AddString(ui_tl_cb, 'Бензопила');
API_Combobox_AddString(ui_tl_cb, 'Ракетница');
API_Combobox_AddString(ui_tl_cb, 'Плазмаган'); //36
API_Combobox_AddString(ui_tl_cb, 'BFG9000');
API_Combobox_AddString(ui_tl_cb, 'Суперпулемет');
API_Combobox_AddString(ui_tl_cb, 'Точка DM'); //39
API_Combobox_SetSel(ui_tl_cb, 0);
