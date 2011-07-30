//searches for an empty player id and returns it
for(i = 1; i < global.sv_maxplayers; i += 1)
{
    if global.sv_plr[i] == noone {break;}
}

return i;
