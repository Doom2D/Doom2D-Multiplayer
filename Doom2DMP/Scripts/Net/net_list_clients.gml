if !variable_global_exists("pl_id") {exit;}
str[1] = '###ID#';
str[2] = '###ИМЯ#';
str[3] = '###ФРАГИ#';
for (i = 1; i <= 16; i += 1)
{
    if global.cl_plr[i] == -1 {continue;}
    if !instance_exists(global.cl_plr[i]) {continue;}
    with global.cl_plr[i] {if !variable_local_exists('cl_name') {continue;}}
    str[1] += string(i) + "#";
    str[2] += global.cl_plr[i].cl_name + "#";
    str[3] += string(global.cl_plr[i].frag) + "#";
}
//return str[argument0];
