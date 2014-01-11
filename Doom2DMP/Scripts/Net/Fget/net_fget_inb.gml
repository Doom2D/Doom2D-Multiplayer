//appends sv_dl_rate +- whatever bytes to the file

if global.dem_mode >= 2 {exit;}

var _step;
_step = dll39_read_byte(dll39_default_buffer);

if !global.fget_state || global.fget_file == -1
{
    //con_add(':: NET: FGET: В данный момент не принимается никаких файлов.');
    exit;
}

dll39_file_set_pos(global.fget_file, global.fget_pos);

dll39_buffer_clear(global.fget_buf);
dll39_buffer_copy2(global.fget_buf, 2, _step, dll39_default_buffer);
dll39_file_write(global.fget_file, global.fget_buf);

global.fget_pos += _step;

dll39_write_byte(16, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);
