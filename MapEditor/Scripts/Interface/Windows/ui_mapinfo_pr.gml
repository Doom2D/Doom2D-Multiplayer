//processes map information window
if ui_win4 == noval {exit;}

var cmd5;
cmd5 = API_Check_Command(5);
if cmd5 == WM_NULL {exit;}

switch cmd5
{
  case ui_win4_bt:
    ui_mapinfo_set();
  break;

  case WM_DESTROY:
    ui_win4 = noval;
  break;
}
