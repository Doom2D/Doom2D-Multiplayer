//loads a GML file, processes and stores contents in string
//returns string

if object_index != o_plugin exit;

var _fn, _f, _str;
_fn = 'data\plugins\' + plug_dir + '\' + string(argument0);
_str = '';

if !file_exists(_fn) return 'void();';
if string_lower(filename_ext(_fn)) != '.gml' return 'void();';

_f = file_text_open_read(_fn);

while !file_text_eof(_f)
{
    _str += file_text_read_string(_f) + eol;
    file_text_readln(_f);
}

file_text_close(_f);

return plug_prepare(_str);


