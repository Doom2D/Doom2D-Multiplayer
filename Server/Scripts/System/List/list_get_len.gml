//returns length of argument0

if !variable_global_exists(argument0) {return -1;}
return ds_list_size( variable_global_get(argument0) );
