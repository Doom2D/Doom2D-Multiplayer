//adds sv_dlrate bytes to the file
//a0 - rate
//a1 - pos
var _pos, _b;
_pos = argument1;
_b = 0;

if !global.fget_state 
{
    //con_add(':: NET: FGET: Сейчас не получаем никаких файлов.');
    exit;
}

repeat argument0
{
    _b = dll39_read_byte(0);
    file_bin_seek(global.fget_file, _pos);
    file_bin_write_byte(global.fget_file, _b);
    _pos += 1;
}

global.fget_pos = argument1 + _pos;
