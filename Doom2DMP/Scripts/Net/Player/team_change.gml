//sends a teamchange request
if !variable_global_exists('cl_inst') {exit;}
if !instance_exists(global.cl_inst) {exit;}
if global.dem_mode >= 2 {exit;}

if global.mp_gamemode == 0
{
    con_add(':: Вы сейчас не играете в CTF/TDM.');
    exit;
}

if global.cl_inst.cl_team == 1
{
        dyclearbuffer(0);
        dywritebyte(12, 0);
        dywritebyte(2, 0);
        dysendmessage(global.cl_tcp, 0, 0, 0);
}
if global.cl_inst.cl_team == 2
{
        dyclearbuffer(0);
        dywritebyte(12, 0);
        dywritebyte(1, 0);
        dysendmessage(global.cl_tcp, 0, 0, 0);
}

