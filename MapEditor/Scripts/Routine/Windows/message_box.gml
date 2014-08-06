//locks all windows and creates message box
//a0 - text
//a1 - caption
//a2 - flags

var result;

ui_windows_lock();
result = API_Dialog_MessageBox(window_handle(), argument0, argument1, argument2);
ui_windows_unlock();

return result;
