//scrolls menu strings
//argument0 = -1 or 1 - up or down
if argument0 = 1
{
  if sel < menu_n
  {
    str[sel, 2] = false;
    sel += 1;
  }
  else
  {
    sel = 1;
  }
}
if argument0 = -1
{
  if sel > 1
  {
    str[sel, 2] = false;
    sel -= 1;
  }
  else
  {
    sel = menu_n;
  }
}
