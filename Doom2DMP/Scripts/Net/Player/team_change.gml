//sends a teamchange request
if !variable_global_exists('cl_inst') {exit;}
if !instance_exists(global.cl_inst) {exit;}
if global.fget_state || global.dem_mode >= 2 {exit;}

if global.mp_gamemode == 0
{
    con_add(':: Вы сейчас не играете в CTF/TDM.');
    exit;
}

if global.cl_inst.cl_team == 1
{
  dll39_write_byte(12, global.send_buf);
  dll39_write_byte(2, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
}
if global.cl_inst.cl_team == 2
{
  dll39_write_byte(12, global.send_buf);
  dll39_write_byte(1, global.send_buf);
  tcp_send(global.cl_tcp, global.send_buf);
}

