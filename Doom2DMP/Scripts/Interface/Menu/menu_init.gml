//inits menu
//argument0 = font
//argument1 = color
//argument2 = string number
//menu strings define in object's create event under menu_str[n1, n2] array
//where n1 - string number, n2 defines script which menu does if it = 1 and string text if it = 0
sel = 1;
menu_n = argument2;
menu_sc = argument1;
menu_f = argument0;
str[1, 4] = true;
for (i = 2; i < menu_n; i += 1)
{
  str[i, 4] = false;
}


