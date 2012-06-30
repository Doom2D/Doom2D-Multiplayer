//selects a team
if !global.mp_gamemode {return 0;}

var red, blu;
red = team_count(1);
blu = team_count(2);

if !global.mp_autobalance || red == blu
{
    if !argument0 {return choose(1, 2);} else {return argument0;}
}

if red > blu {return 2;} else {return 1;}
