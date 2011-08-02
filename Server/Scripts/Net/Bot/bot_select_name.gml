//selects non-taken name from the name_list
for (a = 1; a < list_get_len('name_list'); a += 1)
{
    if list_get_ind('name_taken', list_get_val('name_list', i)) < 0
    {
        return list_get_val('name_list', i);
        break;
    }
}
return 'default';
