//searches some list (a0) for some string (a1) and returns string id if finds it
var l;
if !variable_global_exists(argument0) {exit;}
l = variable_global_get(argument0);
return ds_list_find_index(l, argument1);
