if instance_number(o_pl) < 2 { return noone; }

var objsel, mindist, newdist;
objsel = noone;
mindist = 0;

with o_pl
{
  if st_talk {continue;}
  if cl_team == other.cl_team {continue;}
  if !st_flag { if st_vis {continue;}
                if st_inv if global.bot_cowardly {continue;} }
  if id == other.id {continue;}

  newdist = point_distance(x, y, other.x, other.y);
  if newdist < mindist || objsel == noone
  {
    objsel = id;
    mindist = newdist;
  }
}

return objsel;
