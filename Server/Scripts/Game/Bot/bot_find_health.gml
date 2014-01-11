var ds, selected;
ds = ds_priority_create();
ds_priority_add(ds, noone, 100000000);

with o_item
{
  if (item == 1 || item == 2 || item == 5 || item == 6) && id != other.id
  { ds_priority_add( ds, id, point_distance(x, y, other.x, other.y) ); }
}

selected = ds_priority_find_min(ds);
ds_priority_destroy(ds);
return selected;
