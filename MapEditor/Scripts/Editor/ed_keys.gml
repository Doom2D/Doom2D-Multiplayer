//view control
if keyboard_check(vk_numpad8) {y_off -= 0.1;}
if keyboard_check(vk_numpad2) {y_off += 0.1;}
if keyboard_check(vk_numpad4) {x_off -= 0.1;}
if keyboard_check(vk_numpad6) {x_off += 0.1;}
if keyboard_check(vk_numpad5) {x_off = 0; y_off = 0;}

if keyboard_check(ord('W')) or keyboard_check(vk_up)
{
  if view_yview < 2 {exit;}
  view_yview -= 4;
}

if keyboard_check(ord('S')) or keyboard_check(vk_down)
{
  if view_yview >= global.map_h-view_hview {exit;}
  view_yview += 4;
}

if keyboard_check(ord('A')) or keyboard_check(vk_left)
{
  if view_xview < 2 {exit;}
  view_xview -= 4;
}

if keyboard_check(ord('D')) or keyboard_check(vk_right)
{
  if view_xview >= global.map_w - view_wview {exit;}
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

if keyboard_check_pressed(vk_f1) {ed_manual();}
if keyboard_check_pressed(vk_f2) {map_load();}
if keyboard_check_pressed(vk_f3) {map_save();}
if keyboard_check_pressed(vk_f4) {if API_Dialog_MessageBox(window_handle(), 'Вы действительно хотите очистить карту?', 'Серьезный вопрос', MB_YESNO) != 7 {map_clear();}}
if keyboard_check_pressed(vk_f5) {ed_tex_load(get_open_filename('Все поддерживаемые файлы текстур |*.tga; *.png; *.jpg; *.gif', 'data\textures\STD_1_16_16.tga'));}
if keyboard_check_pressed(vk_f6) {ed_map_settings();}
if keyboard_check_pressed(vk_f7) {ed_settings();}
if keyboard_check_pressed(vk_f8) {if !directory_exists('screenshots') {directory_create('screenshots');} screen_save('screenshots\scr_ed' + string(current_day) + string(current_month) + string(current_year) + string(current_hour) + string(current_minute) + string(current_second) + '.png');} 
if keyboard_check_pressed(vk_f9) 
{
    if API_Dialog_MessageBox(window_handle(), 'Уже уходите?', 'Серьезный вопрос', MB_YESNO) == 7 {exit;}
    game_end();
}
