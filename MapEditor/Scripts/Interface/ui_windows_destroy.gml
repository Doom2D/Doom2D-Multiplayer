//destroys all interface windows
//a0 - destroy all windows (true) or only with information about map (false)

if argument0
{
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
  
  if ui_win6 != -1
  {
    API_Window_Destroy(ui_win6);
    ui_win6 = -1;
  }
  if ui_win7 != -1
  {
    API_Window_Destroy(ui_win7);
    ui_win7 = -1;
  }
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
if ui_win5 != -1
{
  API_Window_Destroy(ui_win5);
  ui_win5 = -1;
}
