//appends sv_dl_rate +- whatever bytes to the file

if global.dem_mode >= 2 {exit;}
if !global.fget_state
{
  //con_add(':: NET: FGET: В данный момент не принимается никаких файлов.');
  exit;
}

var _step;
_step = dll39_read_byte(dll39_default_buffer) + 1; //to allow 1-256 range
dll39_buffer_copy2(global.fget_buf, 3, _step, dll39_default_buffer);
global.fget_pos += _step;

net_fget_req();
