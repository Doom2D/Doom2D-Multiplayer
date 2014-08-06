//loads a list of something
//argument0 - filename
//argument1 - global variable name

if !file_exists(argument0) || !variable_global_exists(argument1) {exit;}

var f, l;
f = file_text_open_read(argument0);
l = ds_list_create();

while !file_text_eof(f)
{
  ds_list_add( l, file_text_read_string(f) );
  file_text_readln(f);
}

variable_global_set(argument1, l);
file_text_close(f);
con_add(':: List: Loaded list ' + argument1 + ' from file ' + argument0);

