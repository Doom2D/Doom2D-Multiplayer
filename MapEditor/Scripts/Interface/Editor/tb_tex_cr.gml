//creates list of the textures in the toolbox window

create_text(ui_win1, 8, 48, 64, 12, 'Текстура');
ui_tx_cb = API_Combobox_Create(ui_win1, 8, 64, 200, 20, CBS_HASSTRINGS|CBS_DROPDOWNLIST|WS_VSCROLL);
ui_tx_bt = API_Button_Create(ui_win1, 217, 64, 21, 21);
API_Control_SetText(ui_tx_bt, '+');

tb_tex_reset(false);
