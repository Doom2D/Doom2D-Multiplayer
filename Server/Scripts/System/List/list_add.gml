//adds string argument1 to list argument0
var l;
if !variable_global_exists(argument0) {exit;}
l = variable_global_get(argument0);
ds_list_add(l, argument1);
variable_global_set(argument0, l);
