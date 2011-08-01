//loads a list of something
//argument0 - filename
//argument1 - global variable name
var f, l, t;

if !file_exists(argument0) || !variable_global_exists(argument1) {exit;}

f = file_text_open_read(argument0);
l = ds_list_create();
t = '';

while !file_text_eof(f)
{
    t = file_text_read_string(f);
    ds_list_add(l, t);
    file_text_readln(f);
}

variable_global_set(argument1, l);
file_text_close(f);
con_add(':: List: Loaded list ' + argument1 + ' from file ' + argument0);

