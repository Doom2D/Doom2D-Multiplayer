if quiet {exit;}
//creates the console window
global.gui[0] = API_Window_Create(0, window_get_x(), window_get_y(), 400, 320, WS_OVERLAPPED|WS_CAPTION|WS_SYSMENU|WS_MINIMIZEBOX, 0);
API_Window_SetText(global.gui[0], 'Сервер Doom 2D Multiplayer 0.6');
API_Window_SetIcon(global.gui[0], API_Window_GetIcon(window_handle()));
API_Window_SetSmIcon(global.gui[0], API_Window_GetSmIcon(window_handle()));

//creates the console textbox
global.gui[1] = API_Edit_Create(global.gui[0], 8, 8, 378, 220, ES_READONLY|ES_MULTILINE|WS_VSCROLL, WS_EX_CLIENTEDGE);

//creates the console inputbox
global.gui[2] = API_Edit_Create(global.gui[0], 8, 242, 316, 20, ES_AUTOHSCROLL|ES_AUTOVSCROLL|ES_MULTILINE, WS_EX_CLIENTEDGE);

//creates the send button
global.gui[3] = API_Button_Create(global.gui[0], 332, 242, 24, 20);
API_Control_SetText(global.gui[3], '>>');

//creates the prevcmd button
global.gui[4] = API_Button_Create(global.gui[0], 362, 242, 24, 20);
API_Control_SetText(global.gui[4], '<<');

//creates the statusbar
global.gui[5] = API_Status_Create(global.gui[0], 0);
API_Status_SetParts(global.gui[5], 5, 120, 235, 280, 340, -1);

API_Check_Set(1, global.gui[0]);
