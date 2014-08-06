//destroys all interface windows
//a0 - destroy all windows (true) or only with information about map (false)

if argument0
{
  if ui_win1 != noval { API_Window_Destroy(ui_win1); ui_win1 = noval; }
  if ui_win2 != noval { API_Window_Destroy(ui_win2); ui_win2 = noval; }  
  if ui_win6 != noval { API_Window_Destroy(ui_win6); ui_win6 = noval; }
  if ui_win7 != noval { API_Window_Destroy(ui_win7); ui_win7 = noval; }
  if ui_win8 != noval { API_Window_Destroy(ui_win8); ui_win8 = noval; }
}

if ui_win3 != noval { API_Window_Destroy(ui_win3); ui_win3 = noval; }
if ui_win4 != noval { API_Window_Destroy(ui_win4); ui_win4 = noval; }
if ui_win5 != noval { API_Window_Destroy(ui_win5); ui_win5 = noval; }
if ui_win9 != noval { API_Window_Destroy(ui_win9); ui_win9 = noval; }

