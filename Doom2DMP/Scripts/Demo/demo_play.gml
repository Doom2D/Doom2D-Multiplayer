if global.map_w != 0 || global.dem_mode == 1 {con_add(":: DEMO: В данный момент проигрывание невозможно."); exit;}

global.dem_mode = 2;

if !file_exists(global.dem_fn)
{
    con_add(":: DEMO: Файл не найден: " + global.dem_fn + ".");
    cl_disconnect();
    mus_play(global.mus_menu);
    room_goto(rm_menu);
    exit;
}

global.dem_f = dyfileopen(global.dem_fn, 0);
con_add(":: DEMO: Проигрывание записи: " + global.dem_fn + ".");

dyclearbuffer(global.dem_b);
dyfileread(global.dem_f, 4, global.dem_b);
if dyreadchars(3, global.dem_b) != "DGP" || dyreadbyte(global.dem_b) != global.dem_ver
{
    con_add(":: DEMO: ERROR: Некорректный файл записи.");
    cl_disconnect(); 
    mus_play(global.mus_menu);
    room_goto(rm_menu); 
    exit;
}

dyclearbuffer(global.dem_b);

dyfileread(global.dem_f, 4, global.dem_b);
global.dem_t = dyreadushort(global.dem_b);
global.dem_sz = dyreadushort(global.dem_b);

o_client._dem_time = global.dem_t;
exit;
