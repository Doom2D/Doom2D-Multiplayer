//inits textures combobox
ui_tx_txt = API_Static_Create(ui_win1, 8, 48, 64, 12, 0, 0);
API_Control_SetText(ui_tx_txt, 'Текстуры:');
ui_tx_cb = API_Combobox_Create(ui_win1, 8, 64, 144, 20, CBS_HASSTRINGS|CBS_DROPDOWNLIST|WS_VSCROLL, 0);
ui_tx_bt = API_Button_Create(ui_win1, 164, 64, 20, 20, 0);
API_Control_SetText(ui_tx_bt, '+');

//no texture
API_Combobox_AddString(ui_tx_cb, 'Нет текстуры'); //0
API_Combobox_SetSel(ui_tx_cb, 0);
