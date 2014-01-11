//creates list of the tiles at the toolbox window

create_text(ui_win1, 8, 4, 64, 12, 'Тайл');
ui_tl_cb = API_Combobox_Create(ui_win1, 8, 20, 200, 20, CBS_HASSTRINGS|CBS_DROPDOWNLIST|WS_VSCROLL);

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
API_Combobox_AddString(ui_tl_cb, 'Ящик патронов');
API_Combobox_AddString(ui_tl_cb, '4 гильзы');
API_Combobox_AddString(ui_tl_cb, '25 гильз'); //24
API_Combobox_AddString(ui_tl_cb, 'Бутылек +4 HP');
API_Combobox_AddString(ui_tl_cb, 'Черепок +5 AP');
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
API_Combobox_AddString(ui_tl_cb, 'Красная точка DM');
API_Combobox_AddString(ui_tl_cb, 'Синяя точка DM');
API_Combobox_AddString(ui_tl_cb, 'Красный флаг'); 
API_Combobox_AddString(ui_tl_cb, 'Синий флаг'); //43
API_Combobox_AddString(ui_tl_cb, 'Триггер (касание)');
API_Combobox_AddString(ui_tl_cb, 'Триггер (нажатие)');
API_Combobox_AddString(ui_tl_cb, 'Триггер (выстрел)'); 
API_Combobox_AddString(ui_tl_cb, 'Триггер (начало игры)'); //47
API_Combobox_AddString(ui_tl_cb, 'Триггер (расширитель)');
API_Combobox_AddString(ui_tl_cb, 'Невидимость');
API_Combobox_AddString(ui_tl_cb, 'Костюм');
API_Combobox_SetSel(ui_tl_cb, 0);

