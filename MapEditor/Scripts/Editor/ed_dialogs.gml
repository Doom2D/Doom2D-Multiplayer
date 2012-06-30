//Dialogs. No more, no less.
//Code by Black Doomer.
//Argument0 - name of dialog

switch (string_lower(argument0))
{
  case 'exit':
    //Exit dialog
    if API_Dialog_MessageBox(window_handle(),
      'Уже уходите?',
      'Серьезный вопрос',
    MB_YESNO) != 7 {game_end();};
  break;
  case 'mapclr':
    //Map clear dialog
    if API_Dialog_MessageBox(window_handle(),
      'Вы действительно хотите очистить карту?',
      'Серьезный вопрос',
    MB_YESNO) != 7 {map_clear(false);};
  break;
  case 'manual':
    //Opens the manual
    if file_exists("docs\Editor_Manual.txt")
    {execute_shell("docs\Editor_Manual.txt", -1);}
  break;
  case 'texadd':
    //Texture adding dialog
    ed_tex_load(get_open_filename(
      'Все поддерживаемые файлы текстур
      |*.tga; *.png; *.jpg; *.gif',
      'data\textures\STD_1_16_16.tga'
    ));
  break;
  case 'about':
    //About window
    API_Dialog_MessageBox(window_handle(),
      'Редактор карт для Doom 2D Multiplayer 0.6'
      + chr(13) + chr(10) +
      '(C) PrimuS, 2011-2012',
      'О программе',
    MB_OK);
  break;
}
