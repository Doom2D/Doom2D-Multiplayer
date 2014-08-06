// have to make a separate function for this one

if object_index != o_plugin exit;

var _fn, _f, _str;
_fn = 'data\plugins\' + plug_dir + '\info.gml';
_str = '';

if !file_exists(_fn) return false;

_f = file_text_open_read(_fn);

while !file_text_eof(_f)
{
    _str += file_text_read_string(_f) + eol;
    file_text_readln(_f);
}

file_text_close(_f);

execute_string(plug_prepare(_str, 256));
return true;

