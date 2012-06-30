//inits slist object
for (i = 0; i < 64; i += 1)
{
    global.slist[i, 0] = '127.0.0.1';
    global.slist[i, 1] = '';
    global.slist[i, 2] = '';
    global.slist[i, 3] = '';
    global.slist[i, 4] = '';
}
global.slist[0, 5] = 0;
global.slist[1, 1] = 'ОБНОВЛЕНИЕ СПИСКА...';

screen_redraw();
net_slist_get();

if global.slist[0, 5] == 0 {global.slist[1, 1] = 'НЕТ СЕРВЕРОВ В СПИСКЕ.';}
