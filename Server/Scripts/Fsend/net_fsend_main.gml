//the file sending process
//a0 - client id

if fsend_pos >= fsend_size
{
  net_fsend_finish(argument0);
  exit;
}

var _step;
_step = global.sv_dl_rate;
if fsend_pos + global.sv_dl_rate > fsend_size {_step = fsend_size - fsend_pos;}

dll39_buffer_clear(fsend_buf);
dll39_file_read(fsend_file, _step, fsend_buf);

dll39_buffer_clear(0);
dll39_write_byte(22, 0); 
dll39_write_byte(_step, 0);
dll39_buffer_copy(0, fsend_buf);

dll39_message_send(cl_tcp, 0, 0, 0);

fsend_pos += _step;

if !st_inv {st_inv = 1; st_talk = 1;}

