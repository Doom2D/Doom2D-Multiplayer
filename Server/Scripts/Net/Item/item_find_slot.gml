//finds an empty item slot
for(i = 1; i < 24000; i += 1)
{
    if global.sv_itm[i] == noone {break;}
}

return i;
