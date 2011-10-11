//selects non-taken name from the name_list
var _i, _done, _n;
_done = false;
while !_done
{
    _i = irandom(list_get_len('name_list'));
    if list_get_ind('name_taken', list_get_val('name_list', _i)) < 0
    {
        _n = string(list_get_val('name_list', _i))
        _done = true;
    }
}
return _n;
