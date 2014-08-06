//raises an error if argument0 isn't true
//a0 - expression to test
//a1 - error string

if object_index != o_plugin exit;
if argument0 exit;
con_add(":: SYSTEM: " + plug_dir + ": ERROR: " + string(argument1));
