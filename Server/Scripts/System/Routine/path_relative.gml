//this script deletes working_directory from path
//wrote to avoid bugs with differences in cases when using string_replace()
//arg0 - path to make relative

var rpath;
rpath = argument0;
if string_count(string_lower(working_directory) + '\', string_lower(rpath)) != 1 {return rpath;}
return string_delete(rpath, 1, string_length(working_directory) + 1);
