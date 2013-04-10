//processes map settings window
if ui_win3 == -1 {exit;}

var cmd4;
cmd4 = API_Check_Command(4);
if cmd4 == 0 {exit;}

switch cmd4
{
  case ui_win3_b1:
    var temp_fn, chdir;
    temp_fn = get_open_filename('Все поддерживаемые файлы музыки
                                |*.xm; *.mod; *.it; *.s3m; *.wav; *.mp3; *.ogg; *.mid',
                                global.map_mus);
    if !file_exists(temp_fn) {exit;}
    chdir = string_lower(string_copy(string_replace(temp_fn, working_directory, ''), 2, 10));
    if chdir != 'data\music'
    {
      API_Dialog_MessageBox(ui_win3,
          'Файл музыки должен находиться в data\music.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    global.map_mus = string_replace(temp_fn, working_directory + '\', '');
    API_Control_SetText(ui_win3_t1, string_delete(global.map_mus, 1, 11));
  break;

  case ui_win3_b2:
    var temp_fn, chdir;
    temp_fn = get_open_filename('Все поддерживаемые файлы текстур
                                |*.tga; *.png; *.jpg; *.gif',
                                global.map_bkg);
    if !file_exists(temp_fn) {exit;}
    chdir = string_lower(string_copy(string_replace(temp_fn, working_directory, ''), 2, 8));
    if chdir != 'data\sky'
    {
      API_Dialog_MessageBox(ui_win3,
          'Текстура фона должна находиться в data\sky.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    global.map_bkg = string_replace(temp_fn, working_directory + '\', '');
    API_Control_SetText(ui_win3_t2, string_delete(global.map_bkg, 1, 9)); 
  break;
        
  case ui_win3_b3:
    global.map_w = real(API_Control_GetText(ui_win3_e1));
    global.map_h = real(API_Control_GetText(ui_win3_e2));
    global.map_name = string_copy(API_Control_GetText(ui_win3_e3), 1, 32);
    global.map_desc = string_copy(API_Control_GetText(ui_win3_e4), 1, 64);
    API_Window_Destroy(ui_win3);
    ui_win3 = -1;
    ui_upd_title();
  break;
}
