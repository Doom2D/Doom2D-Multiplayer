//selects non-taken name from the name_list
var _i, _done, _n;
_done = false;
while !_done
{
    _i = irandom(list_get_len('name_list') - 1);
    if list_get_ind('name_taken', list_get_val('name_list', _i)) < 0
    {
        _n = string(list_get_val('name_list', _i))
        _done = true;
    }
    if list_get_len('name_list') <= list_get_len('name_taken')
    {
        _n = '0';
        _done = true;
    }
}
return _n;
