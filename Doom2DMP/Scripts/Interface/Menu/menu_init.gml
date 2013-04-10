//inits menu
//argument0 = font
//argument1 = color
//argument2 = string number
//argument3 - spacing
//menu strings define in object's create event under menu_str[n1, n2] array
//where n1 - string number, n2 defines script which menu does if it = 1 and string text if it = 0
sel = 1;
global.menu_sel = 1;
menu_n = argument2;
menu_sc = argument1;
menu_f = argument0;
menu_spc = argument3;
menu_mrk = s_marker;
if menu_spc <= 24 {menu_mrk = s_marker2;}

for (i = 0; i < menu_n; i += 1)
{
    str[i, 0] = '';
    str[i, 1] = '';
    str[i, 2] = '';
    str[i, 3] = '';
    str[i, 4] = '';
}
