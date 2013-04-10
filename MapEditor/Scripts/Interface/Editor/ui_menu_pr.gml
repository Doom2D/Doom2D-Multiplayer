//processes menu
var cmd1;
cmd1 = API_Check_Command(1);
if cmd1 == 0 {exit;}

switch cmd1
{
  //first menu
  case ui_mbar_m1_create:
    dlg_clearmap();
  break;
  case ui_mbar_m1_open:
    map_load();
  break;
  case ui_mbar_m1_save:
    map_save(false);
  break;
  case ui_mbar_m1_saveas:
    map_save(true);
  break;
  case ui_mbar_m1_exit:
    dlg_exit();
  break;
  
  //second menu
  case ui_mbar_m2_mapinfo:
    ui_mapinfo_cr();
  break;
  case ui_mbar_m2_deltex:
    ui_deltex_cr();
  break;
  case ui_mbar_m2_moveobj:
    ui_moveobj_cr();
  break;
  case ui_mbar_m2_texopt:
    if global.tex_n == 1
    {
      API_Dialog_MessageBox(window_handle(),
          'Список текстур пуст.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }

    if !mb_confirm(window_handle()) {exit;}

    var tx_proc, tx_done;
    tx_proc = 1; tx_done = 0;
    while tx_proc < global.tex_n
    {
      if ed_tex_delete(tx_proc) {tx_done += 1;} else {tx_proc += 1;}
    }

    API_Dialog_MessageBox(window_handle(),
        'Текстур до оптимизации: ' + string(global.tex_n + tx_done - 1) + chr(10) + chr(13) +
        'Текстур после оптимизации: ' + string(global.tex_n - 1) + chr(10) + chr(13) +
        'Удалено текстур: ' + string(tx_done),
        'Оптимизация текстур', MB_OK|MB_ICONINFORMATION);
  break;
  case ui_mbar_m2_mapopt:
    ui_mapopt_cr();
  break;
  
  //third menu
  case ui_mbar_m3_edsets:
    ui_edsets_cr();
  break;
  case ui_mbar_m3_mapsets:
    ui_mapsets_cr();
  break;
  case ui_mbar_m3_reinit:
    ui_windows_destroy(true);
    ed_ui_init();
  break;
  
  //fourth menu
  case ui_mbar_m4_manual:
    dlg_manual();
  break;
  case ui_mbar_m4_about:
    API_Dialog_MessageBox(window_handle(),
        'Редактор карт для Doom 2D Multiplayer 0.6' + chr(13) + chr(10) +
        '© PrimuS, Черный Думер' + chr(13) + chr(10) +
        'www.doom2d.org, 2011-2013',
        'О программе', MB_OK|MB_ICONINFORMATION);
  break;
}
