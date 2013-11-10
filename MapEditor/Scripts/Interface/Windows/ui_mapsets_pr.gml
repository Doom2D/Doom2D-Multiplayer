//processes map settings window
if ui_win3 == -1 {exit;}

var cmd4;
cmd4 = API_Check_Command(4);
if cmd4 == 0 {exit;}

switch cmd4
{
  case ui_win3_b1:
    var std_fn, temp_fn, chdir;
    if t_new_mus == MAP_NOMUS {std_fn = 'data\music\AC.xm';} else {std_fn = t_new_mus;}
    temp_fn = get_open_filename('Все поддерживаемые файлы музыки
                                |*.xm; *.mod; *.it; *.s3m; *.wav; *.mp3; *.ogg; *.mid',
                                std_fn);
    if !file_exists(temp_fn) {exit;}
    temp_fn = path_relative(temp_fn);
    chdir = string_lower(string_copy(temp_fn, 1, 11));
    if chdir != 'data\music\'
    {
      API_Dialog_MessageBox(ui_win3,
          'Файл музыки должен находиться в data\music.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    t_new_mus = temp_fn;
    API_Control_SetText(ui_win3_t1, dp_music(temp_fn));
  break;
  case ui_win3_b2:
    t_new_mus = MAP_NOMUS;
    API_Control_SetText(ui_win3_t1, 'Без музыки');
  break;
  
  case ui_win3_b3:
    var std_fn, temp_fn, chdir;
    if t_new_bkg == MAP_NOBKG {std_fn = 'data\sky\D2DSKY1.png';} else {std_fn = t_new_bkg;}
    temp_fn = get_open_filename('Все поддерживаемые файлы текстур
                                |*.tga; *.png; *.jpg; *.gif',
                                std_fn);
    if !file_exists(temp_fn) {exit;}
    temp_fn = path_relative(temp_fn);
    chdir = string_lower(string_copy(temp_fn, 1, 9));
    if chdir != 'data\sky\'
    {
      API_Dialog_MessageBox(ui_win3,
          'Текстура фона должна находиться в data\sky.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    t_new_bkg = temp_fn;
    API_Control_SetText(ui_win3_t2, dp_sky(temp_fn)); 
  break;
  case ui_win3_b4:
    t_new_bkg = MAP_NOBKG;
    API_Control_SetText(ui_win3_t2, 'Без фона');
  break;
        
  case ui_win3_b5:
    global.map_mus = t_new_mus;
    global.map_bkg = t_new_bkg;
    global.map_w = real(API_Control_GetText(ui_win3_e1));
    global.map_h = real(API_Control_GetText(ui_win3_e2));
    global.map_name = string_copy(API_Control_GetText(ui_win3_e3), 1, 32);
    global.map_desc = string_copy(API_Control_GetText(ui_win3_e4), 1, 64);
    ed_bkg_change();
    ui_upd_title();
    API_Window_Destroy(ui_win3);
    ui_win3 = -1;
  break;
  case ui_win3_b6:
    API_Window_Destroy(ui_win3);
    ui_win3 = -1;
  break;
}
