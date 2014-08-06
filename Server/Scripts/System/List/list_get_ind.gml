//searches some list (a0) for some string (a1) and returns string id if finds it

if !variable_global_exists(argument0) {exit;}
return ds_list_find_index( variable_global_get(argument0), argument1 );
