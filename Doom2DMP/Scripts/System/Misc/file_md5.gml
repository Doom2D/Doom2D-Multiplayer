//gets a textfile's md5
//a0 - file
var _str, _f, _md5;
_md5 = '';
_str = '';

if !file_exists(argument0) {return _md5;}
_f = file_text_open_read(argument0);

while !file_text_eof(_f)
{
    _str += file_text_read_string(_f);
    file_text_readln(_f);
}

file_text_close(_f);
_md5 = dll39_md5_string(_str);

return _md5;
