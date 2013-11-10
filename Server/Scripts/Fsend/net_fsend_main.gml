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

dyclearbuffer(fsend_buf);
dyfileread(fsend_file, _step, fsend_buf);

dyclearbuffer(0);
dywritebyte(22, 0); 
dywritebyte(_step, 0);
dycopybuffer(0, fsend_buf);

dysendmessage(cl_tcp, 0, 0, 0);

fsend_pos += _step;

if !st_inv {st_inv = 1; st_talk = 1;}


