//inits slist object
for (i = 0; i < 64; i += 1)
{
    server[i, 1] = 'No servers available.';
    server[i, 2] = '';
    server[i, 3] = '127.0.0.1';
}
str1 = '...';
str2 = '...';
screen_redraw();
ds_list_clear(global.slist);
net_slist_get('slist');
str1 = '';
str2 = '';
for (i = 0; i <= ds_list_size(global.slist); i+= 1)
{
    if !is_real(ds_list_find_value(global.slist, i)) 
    {
        var str;
        str = string_explode(ds_list_find_value(global.slist, i), ' | ', false);
        if !is_real(ds_list_find_value(str, 0)) {server[i, 1] = ds_list_find_value(str, 0);}
        if !is_real(ds_list_find_value(str, 1)) {server[i, 2] = ds_list_find_value(str, 1);}
        if !is_real(ds_list_find_value(str, 2)) {server[i, 3] = ds_list_find_value(str, 2);}
        str1 += string(server[i, 1]) + '#';
        str2 += string(server[i, 2]) + '#';
    }
}
