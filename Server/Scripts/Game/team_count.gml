//returns the number of players in corresponding team
var c;
c = 0;

with o_pl { if cl_team == argument0 {c += 1;} }
return c;
