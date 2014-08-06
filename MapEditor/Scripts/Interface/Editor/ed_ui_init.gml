ed_set_window(std_win_w, std_win_h, false);

//creates toolbox window
ui_win1 = API_Window_Create(window_handle(),
                            window_get_x(), window_get_y(),
                            256, 172,
                            WS_OVERLAPPED|WS_CAPTION);
API_Window_SetText(ui_win1, 'Инструменты');
tb_tiles_cr();
tb_tex_cr();
tb_trig_cr();
API_Check_Set(2, ui_win1);

var i;
for (i = 1; i < global.tex_n; i += 1)
{
  API_Combobox_AddString(ui_tx_cb, get_tex_str(i));
}

API_Window_SetFocus(window_handle());
