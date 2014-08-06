//loads all pkugins from plug_list

var l;
l = list_get_len('plug_list');

for (i = 0; i < l; i += 1)
{
    plug_load(list_get_val('plug_list', i));
}
