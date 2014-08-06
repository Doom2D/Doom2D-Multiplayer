//camera moving controls
if keyboard_check(ord('W')) or keyboard_check(vk_up)
{
  if global.map_h > view_hview
  {
    if view_yview >= global.ed_camspeed && view_yview mod global.ed_camspeed == 0
      {view_yview -= global.ed_camspeed;}
    else
      {view_yview -= view_yview mod global.ed_camspeed;}
    keyboard_clear(ord('W'));
  }
}

if keyboard_check(ord('S')) or keyboard_check(vk_down)
{
  if global.map_h > view_hview
  {
    if global.map_h - view_yview - view_hview >= global.ed_camspeed
      {view_yview += global.ed_camspeed;}
    else
      {view_yview += global.map_h - view_yview - view_hview;}
    keyboard_clear(ord('S'));
  }
}

if keyboard_check(ord('A')) or keyboard_check(vk_left)
{
  if global.map_w > view_wview
  {
    if view_xview >= global.ed_camspeed && view_xview mod global.ed_camspeed == 0
      {view_xview -= global.ed_camspeed;}
    else
      {view_xview -= view_xview mod global.ed_camspeed;}
    keyboard_clear(ord('A'));
  }
}

if keyboard_check(ord('D')) or keyboard_check(vk_right)
{
  if global.map_w > view_wview
  {
    if global.map_w - view_xview - view_wview >= global.ed_camspeed
      {view_xview += global.ed_camspeed;}
    else
      {view_xview += global.map_w - view_xview - view_wview;}
    keyboard_clear(ord('D'));
  }
}

//tile moving controls
if keyboard_check(vk_numpad8) {y_off -= 1; keyboard_clear(vk_numpad8);}
if keyboard_check(vk_numpad2) {y_off += 1; keyboard_clear(vk_numpad2);}
if keyboard_check(vk_numpad4) {x_off -= 1; keyboard_clear(vk_numpad4);}
if keyboard_check(vk_numpad6) {x_off += 1; keyboard_clear(vk_numpad6);}
if keyboard_check(vk_numpad5) {x_off = 0; y_off = 0; keyboard_clear(vk_numpad5);}

//layers switching controls
if keyboard_check_pressed(ord('1')) {with o_solid   {visible = !visible;} }
if keyboard_check_pressed(ord('2')) {with o_jthr    {visible = !visible;} }
if keyboard_check_pressed(ord('3')) {with o_bkg     {visible = !visible;} }
if keyboard_check_pressed(ord('4')) {with o_frg     {visible = !visible;} }
if keyboard_check_pressed(ord('5')) {with o_liquid  {visible = !visible;} }
if keyboard_check_pressed(ord('6')) {with o_lift    {visible = !visible;} }
if keyboard_check_pressed(ord('7')) {with o_item    {visible = !visible;} }
if keyboard_check_pressed(ord('8')) {with o_spawn   {visible = !visible;} }
if keyboard_check_pressed(ord('9')) {with o_trigger {visible = !visible;} }
if keyboard_check_pressed(ord('0'))
{
  allvis = !allvis;
  with par_obj {visible = other.allvis;}
}

//hotkeys
if keyboard_check_pressed(vk_f1) {mb_manual();}
if keyboard_check_pressed(vk_f2) {map_load('');}
if keyboard_check_pressed(vk_f3) {map_save(true);}
if keyboard_check_pressed(vk_f4) {dlg_clearmap();}
if keyboard_check_pressed(vk_f5) {ui_mapinfo_cr();}
if keyboard_check_pressed(vk_f6) {ed_tex_select();}
if keyboard_check_pressed(vk_f7) {ui_mapsets_cr();}
if keyboard_check_pressed(vk_f8) {ui_edsets_cr();}
if keyboard_check_pressed(vk_f9)
{
  if !directory_exists('screenshots') {dir_create('screenshots');}
  screen_save('screenshots\ed_' + get_timestamp() + '.png');
} 
if keyboard_check_pressed(vk_f10) {dlg_exit();}

if keyboard_check_pressed(ord('G'))
{
  if global.ed_g_szo == 16 {set_grid_size(8, true);} else {set_grid_size(16, true);}
}
if keyboard_check_pressed(ord('H')) {set_grid_vis(!global.ed_g_vis, true);}
if keyboard_check_pressed(ord('J')) {set_grid_snap(!global.ed_g_use, true);}

