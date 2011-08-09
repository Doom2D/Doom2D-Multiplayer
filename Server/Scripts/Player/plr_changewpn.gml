//this script changes weapon
if cd > 1 {exit;}
if argument0 == 1
{
    for (i = 0; i < 10; i += 1)
    {
        if hw[i] && i > w
        {
            if ((i == 1 || i == 4) && a1 < 1) || ((i == 2 || i == 3 || i == 8) && a2 < 1) || (i == 5 && a3 < 1) || ((i == 6 || i == 7) && a4 < 1) {continue;}
            w = i;
            break;
        }
        if i > 8
        {
            w = 0;
            break;
        }
    }
}
else
{
    for (i = 9; i > -2; i -= 1)
    {
        if i < 0
        {
            w = 10;
            plr_changewpn(2);
            break;
        }
        if hw[i] && i < w
        {
            if ((i == 1 || i == 4) && a1 < 1) || ((i == 2 || i == 3 || i == 8) && a2 < 1) || (i == 5 && a3 < 1) || ((i == 6 || i == 7) && a4 < 1) {continue;}
            w = i;
            break;
        }
    }
}
if w == 9 {alarm[6] = 1;}
plr_send_stat();
