//view control
if keyboard_check(ord('W')) or keyboard_check(vk_up) or keyboard_check(vk_numpad8)
{
  if view_yview < 2 {exit;}
  view_yview -= 4;
}

if keyboard_check(ord('S')) or keyboard_check(vk_down) or keyboard_check(vk_numpad2)
{
  if view_yview >= global.map_h-768 {exit;}
  view_yview += 4;
}

if keyboard_check(ord('A')) or keyboard_check(vk_left) or keyboard_check(vk_numpad4)
{
  if view_xview < 2 {exit;}
  view_xview -= 4;
}

if keyboard_check(ord('D')) or keyboard_check(vk_right) or keyboard_check(vk_numpad6)
{
  if view_xview >= global.map_w - 1024 {exit;}
  view_xview += 4;
}

if keyboard_check_pressed(ord('1')) {with o_bkg {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('2')) {with o_jthr {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('3')) {with o_solid {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('4')) {with o_spawn {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('5')) {with o_item {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('6')) {with o_lift {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('7')) {with o_liquid {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('8')) {with o_frg {if visible == 1 {visible = 0;} else {visible = 1;}}}
