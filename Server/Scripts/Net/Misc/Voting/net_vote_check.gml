//if the vote is allowed
//a0 - command on vote

if string_letters(argument0) == '' {return false;}
for (i = 0; i < list_get_len("vote_list"); i += 1)
{
    if string_count(list_get_val("vote_list", i), argument0)
    {
        return false;
    }
}
return true;
