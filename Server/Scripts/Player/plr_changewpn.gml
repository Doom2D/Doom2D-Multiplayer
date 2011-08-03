//this script changes weapon
if argument0 == 1
{
    for (i = 0; i < 10; i += 1)
    {
        if hw[i] && i > w
        {
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
            w = i;
            break;
        }
    }
}
if w == 9 {alarm[6] = 1;}
plr_send_stat();
