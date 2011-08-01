//returns current date and time in string format
var _str, _date, _time;

_date = string(string(current_day) + '.' + string(current_month) + '.' + string(current_year));

_time = '';
if string_length(string(current_hour)) == 1 {_time += '0';}
_time += string(current_hour) + ':';
if string_length(string(current_minute)) == 1 {_time += '0';}
_time += string(current_minute) + ':';
if string_length(string(current_second)) == 1 {_time += '0';}
_time += string(current_second);
_str = _date + ', ' + _time;

return _str;
