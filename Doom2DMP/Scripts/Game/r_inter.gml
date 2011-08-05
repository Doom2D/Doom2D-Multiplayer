//interscreen
var frg;
frg[0, 0] = 1;
for (i = 1; i <= 32; i += 1)
{
    frg[i, 1] = '';
    frg[i, 2] = -1;
}

global.inter_text[0] = '';
global.inter_text[1] = '';
global.inter_text[2] = '';

global.inter_text[2] = 'Сервер: ' + global.sv_name + '#Карта: ' + global.map_name + '#(' + global.map_desc + ')#';

with o_pl
{
    frg[frg[0, 0], 1] = cl_name;
    frg[frg[0, 0], 2] = frag;
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

for (i = 1; i <= frg[0, 0]; i+=1) 
{
    if frg[order[i], 2] >= 0 {
    global.inter_text[0] += string(i) + '. ' + frg[order[i], 1] + ": #";
    global.inter_text[1] += string(frg[order[i], 2]) + '#';}
}

if argument0 {global._inter_reconnect = true;} else {global._inter_reconnect = false;}
