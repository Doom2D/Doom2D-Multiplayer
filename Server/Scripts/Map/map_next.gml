//sets the next map
if global.sv_cycle_maps == 1
{
    global.map_list_ind = list_get_ind('map_list', global.sv_map);
    if global.map_list_ind == -1  {global.map_list_next = global.sv_map; exit;}
    if global.map_list_ind + 2 > list_get_len('map_list') {global.map_list_ind = -1;}
    global.map_list_next = list_get_val('map_list', global.map_list_ind + 1);
}
if global.sv_cycle_maps == 2
{
    global.map_list_next = global.sv_map;
    while global.map_list_next == global.sv_map
    {
        global.map_list_next = string(list_get_val('map_list', round(random(list_get_len('map_list')))));
    }
}
