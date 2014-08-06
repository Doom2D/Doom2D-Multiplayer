//adds string argument1 to list argument0

if !variable_global_exists(argument0) {exit;}
ds_list_add( variable_global_get(argument0), argument1 );
