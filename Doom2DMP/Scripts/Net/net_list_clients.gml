if !variable_global_exists("sv_maxplayers"){exit;}
if !variable_global_exists("pl_id") {exit;}
var _str;
_str = '';
for (i = 1; i <= 16; i += 1)
{
    if global.cl_plr[i] == -1 {exit;}
    if !instance_exists(global.cl_plr[i]) {exit;}
    _str += string(global.cl_plr[i].cl_id) + "    " + global.cl_plr[i].cl_name + "    " + string(global.cl_plr[i].frag) + "#";
}
return _str;
