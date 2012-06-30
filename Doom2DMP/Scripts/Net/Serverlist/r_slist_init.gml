for (i = 0; i < 32; i += 1)
{
    global.slist[i, 0] = '127.0.0.1';
    global.slist[i, 1] = 'NAME';
    global.slist[i, 2] = 'MAP';
    global.slist[i, 3] = 'PLR';
    global.slist[i, 4] = 'VER';
}
global.slist[0, 5] = 0;
global.slist[1, 1] = 'Обновите серверлист.';
select = 1;
