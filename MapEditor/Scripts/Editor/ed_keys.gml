//camera moving controls
if keyboard_check(ord('W')) or keyboard_check(vk_up)
{
  if global.map_h > view_hview {
    if view_yview >= global.ed_camspeed && (view_yview + view_hview) mod global.ed_camspeed = 0 {
      view_yview -= global.ed_camspeed;
      keyboard_clear(ord('W'));
    } else {
      view_yview -= (view_yview + view_hview) mod global.ed_camspeed;
      keyboard_clear(ord('W'));
    }
  }
}

if keyboard_check(ord('S')) or keyboard_check(vk_down)
{
  if global.map_h > view_hview {
    if global.map_h - view_yview - view_hview >= global.ed_camspeed {
      view_yview += global.ed_camspeed;
      keyboard_clear(ord('S'));
    } else {
      view_yview += global.map_h - view_yview - view_hview;
      keyboard_clear(ord('S'));
    }
  }
}

if keyboard_check(ord('A')) or keyboard_check(vk_left)
{
  if global.map_w > view_wview {
    if view_xview >= global.ed_camspeed && (view_xview + view_wview) mod global.ed_camspeed = 0 {
      view_xview -= global.ed_camspeed;
      keyboard_clear(ord('A'));
    } else {
      view_xview -= (view_xview + view_wview) mod global.ed_camspeed;
      keyboard_clear(ord('A'));
    }
  }
}

if keyboard_check(ord('D')) or keyboard_check(vk_right)
{
  if global.map_w > view_wview {
    if global.map_w - view_xview - view_wview >= global.ed_camspeed {
      view_xview += global.ed_camspeed;
      keyboard_clear(ord('D'));
    } else {
      view_xview += global.map_w - view_xview - view_wview;
      keyboard_clear(ord('D'));
    }
  }
}

//tile moving controls
if keyboard_check(vk_numpad8) {y_off -= 1; keyboard_clear(vk_numpad8);}
if keyboard_check(vk_numpad2) {y_off += 1; keyboard_clear(vk_numpad2);}
if keyboard_check(vk_numpad4) {x_off -= 1; keyboard_clear(vk_numpad4);}
if keyboard_check(vk_numpad6) {x_off += 1; keyboard_clear(vk_numpad6);}
if keyboard_check(vk_numpad5) {x_off = 0; y_off = 0; keyboard_clear(vk_numpad5);}

//layers switching controls
if keyboard_check_pressed(ord('1')) {with o_bkg    {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('2')) {with o_jthr   {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('3')) {with o_solid  {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('4')) {with o_spawn  {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('5')) {with o_item   {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('6')) {with o_lift   {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('7')) {with o_liquid {if visible == 1 {visible = 0;} else {visible = 1;}}}
if keyboard_check_pressed(ord('8')) {with o_frg    {if visible == 1 {visible = 0;} else {visible = 1;}}}

//hotkeys
if keyboard_check_pressed(vk_f1) {ed_dialogs('MANUAL');}
if keyboard_check_pressed(vk_f2) {map_load();}
if keyboard_check_pressed(vk_f3) {map_save();}
if keyboard_check_pressed(vk_f4) {ed_dialogs('MAPCLR');}
if keyboard_check_pressed(vk_f5) {ed_tex_select();}
if keyboard_check_pressed(vk_f6) {ed_map_settings();}
if keyboard_check_pressed(vk_f7) {ed_settings();}
if keyboard_check_pressed(vk_f8)
  {
    if !directory_exists('screenshots') {directory_create('screenshots');}
    screen_save('screenshots\scr_ed' + 
                string(current_day) + string(current_month) + string(current_year) +
                string(current_hour) + string(current_minute) + string(current_second) +
                '.png');
  } 
if keyboard_check_pressed(vk_f9) {ed_dialogs('EXIT');}
