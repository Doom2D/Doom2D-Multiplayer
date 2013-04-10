if global.dem_mode == 1
{
    dyfileclose(global.dem_f);
    dyclearbuffer(global.dem_b);
    global.dem_f = -1;
    con_add(":: DEMO: Запись остановлена.");
    global.dem_mode = 0;
    exit;
}

if global.map_w != 0 || global.dem_mode == 2
{
    con_add(":: DEMO: ERROR: В данный момент запись невозможна.");
    exit;
}

global.dem_fn = 'demos\' + string(current_day) + '-' + string(current_month) + '-' + string(current_year) + '_' +
                           string(current_hour) + '-' + string(current_minute) + '-' + string(current_second) +
                           '.dgp';
if file_exists(global.dem_fn) {file_delete(global.dem_fn);}

global.dem_f = dyfileopen(global.dem_fn, 1);

//signature
dyclearbuffer(global.dem_b);
dywritechars('DGP', global.dem_b);
dywritebyte(global.dem_ver, global.dem_b);
dyfilewrite(global.dem_f, global.dem_b);
dyclearbuffer(global.dem_b);

con_add(":: DEMO: Запись...");
global.dem_mode = 1;
exit;
