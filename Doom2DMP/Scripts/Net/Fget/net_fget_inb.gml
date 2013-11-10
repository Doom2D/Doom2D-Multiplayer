//appends sv_dl_rate +- whatever bytes to the file

if global.dem_mode >= 2 {exit;}

var _step;
_step = dyreadbyte(0);

if !global.fget_state || global.fget_file == -1
{
    //con_add(':: NET: FGET: В данный момент не принимается никаких файлов.');
    exit;
}

dyfilesetpos(global.fget_file, global.fget_pos);

dyclearbuffer(global.fget_buf);
dycopybuffer2(global.fget_buf, 2, _step, 0);
dyfilewrite(global.fget_file, global.fget_buf);

global.fget_pos += _step;

dyclearbuffer(0);
dywritebyte(16, 0);
dysendmessage(global.cl_tcp, 0, 0, 0);
