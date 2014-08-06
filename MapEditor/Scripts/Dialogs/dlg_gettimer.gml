//a0 - string to display
//a1 - standard value

var result;

ui_windows_lock();
result = median(0,
                round( API_Dialog_GetNumber(window_handle(), '',  string(argument0), argument1) ),
                300);
ui_windows_unlock();

return result;
