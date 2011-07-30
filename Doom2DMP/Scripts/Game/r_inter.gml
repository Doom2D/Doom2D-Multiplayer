//interscreen
var frg;
frg[0, 0] = 0;

global.inter_text[0] = '';
global.inter_text[1] = '';
global.inter_text[2] = '';

global.inter_text[2] = 'Сервер: ' + global.sv_name + '#Карта: ' + global.sv_map + '#';

with o_pl
{
    frg[cl_id, 1] = cl_name;
    frg[cl_id, 2] = frag;
    frg[0, 0] += 1;
}

for (i =1; i<=global.sv_maxplayers;i+=1) {order[i] = i}   // initialize a new array to store the sort order

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
    global.inter_text[0] += string(i) + '. ' + frg[order[i], 1] + ": #";
    global.inter_text[1] += string(frg[order[i], 2]) + '#';
}
