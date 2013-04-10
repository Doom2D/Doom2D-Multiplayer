if global.dem_mode != 2 {exit;}

dyfileclose(global.dem_f);
dyclearbuffer(global.dem_b);
dyclearbuffer(0);
global.dem_f = -1;

con_add(":: DEMO: Проигрывание завершено.");

//destroy skins
if instance_number(o_pl) > 0
{
    with (o_pl)
    {
        if !variable_local_exists('sprites') || !variable_local_exists('spr') || !variable_local_exists('cl_id') {continue;}
        for (i = 1; i <= 9; i += 1)
        {
            if sprite_exists(sprites[i, 0]) {sprite_delete(sprites[i, 0]);}
            if sprite_exists(sprites[i, 1]) {sprite_delete(sprites[i, 1]);}
        }
    }
}

//destroy backgrounds and music
if background_exists(global.map_bkg) {if global.map_bkg != bkg_inter {background_delete(global.map_bkg);} global.map_bkg = -1;}

con_add(":: DEMO: Завершено.");
global.dem_mode = 3;
exit;
