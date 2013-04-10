target = instance_nearest_nth(x, y, o_pl, 2);
if !instance_exists(target) {exit;}


var ds,selected;
ds = ds_priority_create();
ds_priority_add(ds,noone,100000000);
with (target) {
    if (!st_talk && !st_vis && id != other.id) {
        ds_priority_add(ds,id,point_distance(x,y,other.x,other.y));
    }
}
selected = ds_priority_find_min(ds);
ds_priority_destroy(ds);
return selected;

