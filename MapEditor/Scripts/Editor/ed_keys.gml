//view control
if keyboard_check(ord('W')) or keyboard_check(vk_up) or keyboard_check(vk_numpad8)
{
  if view_yview < 2 {exit;}
  view_yview -= 2;
}

if keyboard_check(ord('S')) or keyboard_check(vk_down) or keyboard_check(vk_numpad2)
{
  if view_yview >= room_height-768 {exit;}
  view_yview += 2;
}

if keyboard_check(ord('A')) or keyboard_check(vk_left) or keyboard_check(vk_numpad4)
{
  if view_xview < 2 {exit;}
  view_xview -= 2;
}

if keyboard_check(ord('D')) or keyboard_check(vk_right) or keyboard_check(vk_numpad6)
{
  if view_xview >= room_width - 1024 {exit;}
  view_xview += 2;
}
