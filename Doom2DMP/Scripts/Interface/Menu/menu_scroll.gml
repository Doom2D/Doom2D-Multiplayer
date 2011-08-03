//scrolls menu strings
//argument0 = -1 or 1 - up or down
snd_play(0);
if argument0 = 1
{
  if sel < menu_n
  {
    str[sel, 4] = false;
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
    str[sel, 4] = false;
    sel -= 1;
  }
  else
  {
    sel = menu_n;
  }
}
