//the file sending process
//a0 - client id

if fsend_pos == fsend_size
{
    net_fsend_finish(argument0);
    break;
    exit;
}

dyclearbuffer(0);
dywritebyte(22, 0);
dywritebyte(global.sv_dl_rate, 0);
dywriteint(fsend_pos, 0);

repeat global.sv_dl_rate
{
    if fsend_pos == fsend_size {break;}
    file_bin_seek(fsend_file, fsend_pos);
    dywritebyte(file_bin_read_byte(fsend_file), 0); 
    fsend_pos += 1;
}

with id_to_cl(argument0)
{
    dysendmessage(cl_tcp, 0, 0, 0);
    if !st_inv {st_inv = 1; st_talk = 1;}
}
