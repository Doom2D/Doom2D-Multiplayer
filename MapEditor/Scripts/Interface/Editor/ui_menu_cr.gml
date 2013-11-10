//creates menu
ui_mbar = API_Menu_Create();

//menu #1
ui_mbar_m1 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m1, '&Файл');
ui_mbar_m1_create = API_Menu_AddString(ui_mbar_m1, '&Создать');
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1_open = API_Menu_AddString(ui_mbar_m1, '&Открыть');
ui_mbar_m1_save = API_Menu_AddString(ui_mbar_m1, '&Сохранить');
ui_mbar_m1_saveas = API_Menu_AddString(ui_mbar_m1, '&Сохранить как');
API_Menu_AddSeparator(ui_mbar_m1);
ui_mbar_m1_exit = API_Menu_AddString(ui_mbar_m1, '&Выход');
//end of menu//

//menu #2
ui_mbar_m2 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m2, '&Инструменты');
ui_mbar_m2_mapinfo = API_Menu_AddString(ui_mbar_m2, '&Статистика по карте');

//embedded menu #1
  ui_mbar_m2_txsort = API_Menu_CreatePopup();
  API_Menu_AddMenu(ui_mbar_m2, ui_mbar_m2_txsort, '&Отсортировать список текстур');
  ui_mbar_m2_ts1 = API_Menu_AddString(ui_mbar_m2_txsort, '&По возрастанию');
  ui_mbar_m2_ts2 = API_Menu_AddString(ui_mbar_m2_txsort, '&По убыванию');
//end of embedded menu #1//

ui_mbar_m2_deltex = API_Menu_AddString(ui_mbar_m2, '&Удалить текстуры из списка');

//embedded menu #2
  ui_mbar_m2_mapsch = API_Menu_CreatePopup();
  API_Menu_AddMenu(ui_mbar_m2, ui_mbar_m2_mapsch, '&Сохранить схему карты');
  ui_mbar_m2_msf = API_Menu_AddString(ui_mbar_m2_mapsch, '&Карта полностью');
  ui_mbar_m2_ms16 = API_Menu_AddString(ui_mbar_m2_mapsch, '&Миникарта 1:16');
  ui_mbar_m2_ms8 = API_Menu_AddString(ui_mbar_m2_mapsch, '&Миникарта 1:8');
  ui_mbar_m2_ms4 = API_Menu_AddString(ui_mbar_m2_mapsch, '&Миникарта 1:4');
  ui_mbar_m2_ms2 = API_Menu_AddString(ui_mbar_m2_mapsch, '&Миникарта 1:2');
  API_Menu_AddSeparator(ui_mbar_m2_mapsch);
  ui_mbar_m2_alts = API_Menu_AddString(ui_mbar_m2_mapsch, '&Альтернативное сохранение');
  API_Menu_SetItemChecked(ui_mbar_m2_alts, true);
//end of embedded menu #2//

API_Menu_AddSeparator(ui_mbar_m2);
ui_mbar_m2_moveobj = API_Menu_AddString(ui_mbar_m2, '&Переместить объекты карты');
ui_mbar_m2_mirrobj = API_Menu_AddString(ui_mbar_m2, '&Отразить объекты карты');
API_Menu_AddSeparator(ui_mbar_m2);
ui_mbar_m2_texopt = API_Menu_AddString(ui_mbar_m2, '&Удалить неиспользуемые текстуры');
ui_mbar_m2_mapopt = API_Menu_AddString(ui_mbar_m2, '&Удалить лишние тайлы');
//end of menu//

//menu #3
ui_mbar_m3 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m3, '&Параметры');
ui_mbar_m3_mapsets = API_Menu_AddString(ui_mbar_m3, '&Карта');
ui_mbar_m3_edsets = API_Menu_AddString(ui_mbar_m3, '&Редактор');
API_Menu_AddSeparator(ui_mbar_m3);
ui_mbar_m3_reinit = API_Menu_AddString(ui_mbar_m3, '&Перезагрузить интерфейс');
//end of menu//

//menu #4
ui_mbar_m4 = API_Menu_CreatePopup();
API_Menu_AddMenu(ui_mbar, ui_mbar_m4, '&Справка');
ui_mbar_m4_manual = API_Menu_AddString(ui_mbar_m4, '&Руководство');
ui_mbar_m4_about = API_Menu_AddString(ui_mbar_m4, '&О программе');
//end of menu//

API_Menu_Set(window_handle(), ui_mbar);
