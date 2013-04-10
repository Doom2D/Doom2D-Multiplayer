if global.dem_mode != 2 {exit;}

if dyfilepos(global.dem_f) >= dyfilesize(global.dem_f) - 1
{
    con_parse('disconnect');;
    exit;
}

dyclearbuffer(0);
dyfileread(global.dem_f, global.dem_sz, 0);


dyclearbuffer(global.dem_b);
dyfileread(global.dem_f, 4, global.dem_b);


global.dem_t = dyreadushort(global.dem_b);
global.dem_sz = dyreadushort(global.dem_b);


if global.dem_t > 1024
{
    con_parse("disconnect");
    exit;
}

o_client._dem_time = global.dem_t;
