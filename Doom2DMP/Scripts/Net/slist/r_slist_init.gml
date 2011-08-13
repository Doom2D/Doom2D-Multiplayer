for (i = 0; i < 64; i += 1)
{
    server[i, 1] = 'NAME';
    server[i, 2] = 'MAP';
    server[i, 3] = 'IP';
}
ds_list_clear(global.slist);
select = 0;
str1 = '';
str2 = '';
