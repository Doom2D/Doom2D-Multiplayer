//arg0 - reset content

if argument0 {API_Combobox_ResetContent(ui_tx_cb);}
API_Combobox_AddString(ui_tx_cb, 'Нет текстуры'); //NO_TEXTURE = 0
tb_tex_setfirst();
