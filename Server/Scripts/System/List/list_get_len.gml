//returns length of argument0
var l;
if !variable_global_exists(argument0){exit;}
l = variable_global_get(argument0);
return ds_list_size(l);
