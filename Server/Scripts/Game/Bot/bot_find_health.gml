var objsel, mindist, newdist;
objsel = noone;
mindist = 0;

with o_item
{
  if item == 1 || item == 2 || item == 5 || item == 6
  {
    newdist = point_distance( x, y, other.x, other.y );
    if newdist < mindist || objsel == noone
    {
      objsel = id;
      mindist = newdist;
    }
  }
}

return objsel;
