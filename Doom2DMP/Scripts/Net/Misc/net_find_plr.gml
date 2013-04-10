//assholes
if argument1 > 0
{
    for (i = argument0; i <= global.sv_maxplayers; i += 1)
    {
        if global.cl_plr[i] == noone {continue;}
        if !instance_exists(global.cl_plr[i]) {continue;}
        if i == argument0 {continue;}
        return i;
    }
}
else
{
    for (i = argument0; i > 0; i -= 1)
    {
        if global.cl_plr[i] == noone {continue;}
        if !instance_exists(global.cl_plr[i]) {continue;}
        if i == argument0 {continue;}
        return i;
    }
}
