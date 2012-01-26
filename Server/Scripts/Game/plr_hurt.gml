//armor and shit counting algorhytm
//a0 - damage

if ap > 0
{
    ap -= round(argument0/3);
    hp -= round(argument0/3) * 2;
}
else
{
    hp -= argument0;
}

if ap < 0
{
    hp += ap;
    ap = 0;
}
