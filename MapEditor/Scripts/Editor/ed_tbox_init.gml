//toolbox

window_set_size(view_wview, view_hview); //fixes the incorrect window
window_center();                         //size after starting
global.ui_xstart = window_get_x();
global.ui_ystart = window_get_y();

if ui_win1 != -1
{
    API_Window_Destroy(ui_win1);
    ui_win1 = -1;
}
if ui_win2 != -1
{
    API_Window_Destroy(ui_win2);
    ui_win2 = -1;
}
if ui_win3 != -1
{
    API_Window_Destroy(ui_win3);
    ui_win3 = -1;
}
if ui_win4 != -1
{
    API_Window_Destroy(ui_win4);
    ui_win4 = -1;
}

ui_win1 = API_Window_Create(window_handle(), window_get_x(), window_get_y(), 256, 128, WS_OVERLAPPED|WS_CAPTION, 0);
API_Check_Set (2, ui_win1);

API_Window_SetText(ui_win1, 'Инструменты');
ed_ui_tiles(); //add tile cb
ed_ui_tex(); //add texture cb

for (i = 1; i <  global.tex_n; i += 1)
{
    API_Combobox_AddString(ui_tx_cb, string_replace(global.tex_nm[i], 'data\textures\', ''));
}
