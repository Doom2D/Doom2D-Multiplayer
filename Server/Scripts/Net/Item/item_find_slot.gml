//finds an empty item slot
for(i = 1; i < 8192; i += 1)
{
    if global.sv_itm[i] == noone {break;}
}

return i;
