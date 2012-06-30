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
    if ds_list_size(global.map_played) == ds_list_size(global.map_list)
    {
        ds_list_clear(global.map_played);
    }
    ds_list_add(global.map_played, global.sv_map);
    global.map_list_next = global.sv_map
    while ds_list_find_index(global.map_played, global.map_list_next) != -1 || global.map_list_next == '0'
    {
        global.map_list_next = string(list_get_val('map_list', irandom(list_get_len('map_list') + 1)));
    }
}
