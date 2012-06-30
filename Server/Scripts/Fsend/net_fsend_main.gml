//the file sending process
//a0 - client id

if fsend_pos == fsend_size
{
    net_fsend_finish(argument0);
    break;
    exit;
}

dll39_buffer_clear(0);
dll39_write_byte(22, 0);
dll39_write_byte(global.sv_dl_rate, 0);
dll39_write_int(fsend_pos, 0);

repeat global.sv_dl_rate
{
    if fsend_pos == fsend_size {break;}
    file_bin_seek(fsend_file, fsend_pos);
    dll39_write_byte(file_bin_read_byte(fsend_file), 0); 
    fsend_pos += 1;
}

with id_to_cl(argument0)
{
    dll39_message_send(cl_tcp, 0, 0, 0);
    if !st_inv {st_inv = 1; st_talk = 1;}
}
