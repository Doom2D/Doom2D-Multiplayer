window_set_size(view_wview, view_hview);
window_center();

//creates toolbox window
ui_win1 = API_Window_Create(window_handle(),
                            window_get_x(), window_get_y(),
                            256, 172,
                            WS_OVERLAPPED|WS_CAPTION, 0);
API_Window_SetText(ui_win1, 'Инструменты');
tb_tiles_cr();
tb_tex_cr();
tb_trig_cr();
API_Check_Set (2, ui_win1);

var tx_nm;
for (i = 1; i < global.tex_n; i += 1)
{
    tx_nm = global.tex_nm[i];
    if tx_nm != '*ERROR' {tx_nm = string_delete(tx_nm, 1, 14);}
    API_Combobox_AddString(ui_tx_cb, tx_nm);
}

API_Window_SetFocus(window_handle());
