//searches some list (a0) for some index (a1) and returns string if finds it
var l;
if !variable_global_exists(argument0) || !is_real(argument1) {exit;}
l = variable_global_get(argument0);
return ds_list_find_value(l, argument1);
