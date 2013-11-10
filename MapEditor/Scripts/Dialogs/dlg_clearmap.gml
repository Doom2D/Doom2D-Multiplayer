if API_Dialog_MessageBox(window_handle(),
       'Вы действительно хотите очистить карту?',
       '', MB_YESNO|MB_ICONQUESTION) == IDYES {map_clear(false);}
