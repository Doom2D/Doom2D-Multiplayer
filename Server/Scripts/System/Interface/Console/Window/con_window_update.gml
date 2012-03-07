//updates some window parts
if quiet {exit;}

//checks for window's existence
if !API_Window_Exists(global.gui[0])
{
    sys_exit();
    exit;
}

if !API_Window_GetFocus(global.gui[0]) {alarm[3] = 60; exit;}

//updates the statusbar
API_Status_SetText(global.gui[5], 0, global.sv_ip);
API_Status_SetText(global.gui[5], 1, global.sv_map);
API_Status_SetText(global.gui[5], 2, string(instance_number(o_pl)) + '/' + string(global.sv_maxplayers));
API_Status_SetText(global.gui[5], 3, string(round(o_host.alarm[0]/60)));
API_Status_SetText(global.gui[5], 4, string(fps) + '/' + string(room_speed));
