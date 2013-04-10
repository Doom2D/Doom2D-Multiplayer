menu_init(global.fnt_small, c_red, 3, 17);
str[0, 0] = 'ЗВУК';
str[1, 0] = 'Громкость звука';
str[1, 4] = string(round(FMODGroupGetVolume(2)*100)) + '%';
str[1, 2] = "
    if FMODGroupGetVolume(2)*100 < 90
    {
        con_parse('s_vol_sound ' + string(round(FMODGroupGetVolume(2)*100 + 10)));
    }
    else
    {
        con_parse('s_vol_sound 0');
    }
    str[1, 4] = string(round(FMODGroupGetVolume(2)*100)) + '%';";
str[1, 3] = "
    if FMODGroupGetVolume(2)*100 > 10
    {
        con_parse('s_vol_sound ' + string(round(FMODGroupGetVolume(2)*100 - 10)));
    }
    else
    {
        con_parse('s_vol_sound 100');
    }
    str[1, 4] = string(round(FMODGroupGetVolume(2)*100)) + '%';";
    
str[2, 0] = 'Громкость музыки'
str[2, 4] = string(round(FMODGroupGetVolume(3)*100)) + '%';
str[2, 2] = "
    if FMODGroupGetVolume(3)*100 < 90
    {
        con_parse('s_vol_music ' + string(round(FMODGroupGetVolume(3)*100 + 10)));
    }
    else
    {
        con_parse('s_vol_music 0');
    }
    str[2, 4] = string(round(FMODGroupGetVolume(3)*100)) + '%';";
str[2, 3] = "
    if FMODGroupGetVolume(3)*100 > 10
    {
        con_parse('s_vol_music ' + string(round(FMODGroupGetVolume(3)*100 - 10)));
    }
    else
    {
        con_parse('s_vol_music 100');
    }
    str[2, 4] = string(round(FMODGroupGetVolume(3)*100)) + '%';";  

str[3, 0] = 'Назад'
str[3, 1] = 'global.menu_id = 1; instance_create(x, y, o_menu); instance_destroy();'

