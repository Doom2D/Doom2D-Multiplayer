if !variable_global_exists("pl_id") {exit;}
str[1] = '###ID#';
str[2] = '###ИМЯ#';
str[3] = '###ФРАГИ#';

if global.mp_gamemode == 0
{
    for (i = 1; i <= global.sv_maxplayers; i += 1)
    {
        if global.cl_plr[i] == -1 {continue;}
        if !instance_exists(global.cl_plr[i]) {continue;}
        with global.cl_plr[i] {if !variable_local_exists('cl_name') {continue;}}
        str[1] += string(i) + "#";
            if i == global.pl_id {str[2] += '[' + global.cl_plr[i].cl_name + "]#";} else {str[2] += global.cl_plr[i].cl_name + "#";}
        str[3] += string(global.cl_plr[i].frag) + "#";
    }
    exit;
}

//first the red team
str[1] += 'КРАСНАЯ КОМАНДА: ' + string(global.team_score[1]) + '#';
str[2] += '#';
str[3] += '#';
for (i = 1; i <= global.sv_maxplayers; i += 1)
{
    if global.cl_plr[i] == -1 {continue;}
    if !instance_exists(global.cl_plr[i]) {continue;}
    with global.cl_plr[i] {if !variable_local_exists('cl_name') {continue;}}
    if global.cl_plr[i].cl_team != 1 {continue;}
    str[1] += string(i) + "#";
    if i == global.pl_id {str[2] += '[' + global.cl_plr[i].cl_name + "]#";} else {str[2] += global.cl_plr[i].cl_name + "#";}
    str[3] += string(global.cl_plr[i].frag) + "#";
}

str[1] += '#СИНЯЯ КОМАНДА: ' + string(global.team_score[2]) + '#';
str[2] += '##';
str[3] += '##';

//then the blu team
for (i = 1; i <= global.sv_maxplayers; i += 1)
{
    if global.cl_plr[i] == -1 {continue;}
    if !instance_exists(global.cl_plr[i]) {continue;}
    with global.cl_plr[i] {if !variable_local_exists('cl_name') {continue;}}
    if global.cl_plr[i].cl_team != 2 {continue;}
    str[1] += string(i) + "#";
    if i == global.pl_id {str[2] += '[' + global.cl_plr[i].cl_name + "]#";} else {str[2] += global.cl_plr[i].cl_name + "#";}
    str[3] += string(global.cl_plr[i].frag) + "#";
}

//return str[argument0];
