//interscreen
//
// WARNING! THIS PIECE OF CODE IS TOTALLY UNOPTIMIZED AND UNREADABLE (because optimization isn't really necessary here)
// PROCEED WITH CAUTION
//
//////////////
var frg;
global.cl_rc_time = argument1;
global._inter_reconnect = false;
frg[0, 0] = 1;
for (i = 1; i <= 32; i += 1)
{
    frg[i, 1] = '';
    frg[i, 2] = -1;
    frg[i, 3] = -1;
}

global.inter_text[0] = '';
global.inter_text[1] = '';
global.inter_text[2] = '';

global.inter_text[2] = 'Сервер: ' + global.sv_name + '#Карта: ' + global.map_name + ' (' + global.sv_map + '.dlv)#(' + global.map_desc + ')#';

if !global.mp_gamemode
{
    with o_pl
    {
        frg[frg[0, 0], 1] = cl_name;
        frg[frg[0, 0], 2] = frag;
        frg[frg[0, 0], 3] = cl_id;
        frg[0, 0] += 1;
    }

    for (i =0; i<=32;i+=1) {order[i] = i}   // initialize a new array to store the sort order

    for (rep1 = 1; rep1 <= frg[0, 0]; rep1 +=1)
            {
            swapped = false
            for (rep2 = frg[0, 0]; rep2 >= rep1 + 1; rep2 -=1)
                    {
                    if (frg[order[rep2-1],2] < frg[order[rep2],2])
                            {
                                temp1=order[rep2-1]
                                order[rep2-1]=order[rep2]
                                order[rep2]=temp1
                                swapped = true
                            }
                    };
            if (swapped == false)
            {
                break
            }
        };
        
    if !variable_global_exists('pl_id') {exit;}

    for (i = 1; i <= frg[0, 0]; i+=1) 
    {
        if frg[order[i], 2] >= 0 {
        if frg[order[i], 3] == global.pl_id {global.inter_text[0] += string(i) + '. [' + frg[order[i], 1] + "] #";} else {global.inter_text[0] += string(i) + '. ' + frg[order[i], 1] + " #";}
        global.inter_text[1] += string(frg[order[i], 2]) + '#';}
    }
}

else

{
    var ordr;
    if global.team_score[2] > global.team_score[1] {ordr[1] = 2; ordr[2] = 1;} else {ordr[1] = 1; ordr[2] = 2;}
    with o_pl
    {
        if cl_team == ordr[1]
        {
            frg[frg[0, 0], 1] = cl_name;
            frg[frg[0, 0], 2] = frag;
            frg[frg[0, 0], 3] = cl_id;
            frg[0, 0] += 1;
        }
    }
    for (i =0; i<=32;i+=1) {order[i] = i}   // initialize a new array to store the sort order

    for (rep1 = 1; rep1 <= frg[0, 0]; rep1 +=1)
            {
            swapped = false
            for (rep2 = frg[0, 0]; rep2 >= rep1 + 1; rep2 -=1)
                    {
                    if (frg[order[rep2-1],2] < frg[order[rep2],2])
                            {
                                temp1=order[rep2-1]
                                order[rep2-1]=order[rep2]
                                order[rep2]=temp1
                                swapped = true
                            }
                    };
            if (swapped == false)
            {
                break
            }
        };
        
    if !variable_global_exists('pl_id') {exit;}
    if ordr[1] == 1 {global.inter_text[0] += 'КРАСНАЯ КОМАНДА#';} else {global.inter_text[0] += 'СИНЯЯ КОМАНДА#';}
    global.inter_text[1] += string(global.team_score[ordr[1]]) + '#';
    for (i = 1; i <= frg[0, 0]; i+=1) 
    {
        if frg[order[i], 2] >= 0 {
        if frg[order[i], 3] == global.pl_id {global.inter_text[0] += string(i) + '. [' + frg[order[i], 1] + "] #";} else {global.inter_text[0] += string(i) + '. ' + frg[order[i], 1] + " #";}
        global.inter_text[1] += string(frg[order[i], 2]) + '#';}
    }
    global.inter_text[0] += '#';
    global.inter_text[1] += '#';
    
    for (i = 1; i <= 32; i += 1)
    {
        frg[i, 1] = '';
        frg[i, 2] = -1;
        frg[i, 3] = -1;
    }

    
    with o_pl
    {
        if cl_team == ordr[2]
        {
            frg[frg[0, 0], 1] = cl_name;
            frg[frg[0, 0], 2] = frag;
            frg[frg[0, 0], 3] = cl_id;
            frg[0, 0] += 1;
        }
    }
    for (i =0; i<=32;i+=1) {order[i] = i}   // initialize a new array to store the sort order

    for (rep1 = 1; rep1 <= frg[0, 0]; rep1 +=1)
            {
            swapped = false
            for (rep2 = frg[0, 0]; rep2 >= rep1 + 1; rep2 -=1)
                    {
                    if (frg[order[rep2-1],2] < frg[order[rep2],2])
                            {
                                temp1=order[rep2-1]
                                order[rep2-1]=order[rep2]
                                order[rep2]=temp1
                                swapped = true
                            }
                    };
            if (swapped == false)
            {
                break
            }
        };
        
    if !variable_global_exists('pl_id') {exit;}
    if ordr[2] == 1 {global.inter_text[0] += 'КРАСНАЯ КОМАНДА#';} else {global.inter_text[0] += 'СИНЯЯ КОМАНДА#';}
    global.inter_text[1] += string(global.team_score[ordr[2]]) + '#';
    for (i = 1; i <= frg[0, 0]; i+=1) 
    {
        if frg[order[i], 2] >= 0 {
        if frg[order[i], 3] == global.pl_id {global.inter_text[0] += string(i) + '. [' + frg[order[i], 1] + "] #";} else {global.inter_text[0] += string(i) + '. ' + frg[order[i], 1] + " #";}
        global.inter_text[1] += string(frg[order[i], 2]) + '#';}
    }
}

if argument0 == 2 {global.inter_text[0] += '###';}
if argument0 == 1 {global._inter_reconnect = true;}
if global.dem_mode == 2 {global.cl_rc_time = 10; global._inter_reconnect = false;}
