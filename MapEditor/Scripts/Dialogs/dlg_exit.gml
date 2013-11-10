if API_Dialog_MessageBox(window_handle(),
       'Уже уходите?',
       '', MB_YESNO|MB_ICONQUESTION) == IDYES {game_end();}
