//armor and shit counting algorhitm
//a0 - damage

var a;
if ap <= 100 {a = 2;} else {a = 3;}
if ap > 0
{
    ap -= round(argument0/5) * a;
    hp -= round(argument0/5) * (5 - a);
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
