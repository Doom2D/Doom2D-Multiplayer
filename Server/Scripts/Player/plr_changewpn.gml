//this script changes weapon
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
if w == 9 {alarm[6] = 1;}
plr_send_stat();
