//processes toolbox window
obj_sel = API_Combobox_GetSel(ui_tl_cb);
tex_sel = API_Combobox_GetSel(ui_tx_cb);
if tex_sel < 0 {tex_sel = 0;}
trg_sel = API_Combobox_GetSel(ui_tg_cb);

var cmd2;
cmd2 = API_Check_Command(2);
if cmd2 == ui_tx_bt {ed_tex_select();}
