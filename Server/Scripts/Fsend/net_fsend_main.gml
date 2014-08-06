//the file sending process
//a0 - client id

if fsend_pos >= fsend_size
{
  con_add(':: NET: FSEND: Клиенту ' + cl_name + ' отослан файл ' + fsend_file + '.');
  net_fsend_state(false);
  net_fsend_finish(false);
  exit;
}

var _step;
_step = global.sv_dl_rate;
if fsend_pos + _step > fsend_size {_step = fsend_size - fsend_pos;}

dll39_buffer_clear(0);
write_msg_id(22, 0);
dll39_write_byte(_step - 1, 0); //to allow 1-256 range
dll39_buffer_copy2(0, fsend_pos, _step, fsend_buf);
dll39_message_send(cl_tcp, 0, 0, 0);

fsend_pos += _step;

st_inv = 1;
st_talk = 1;

