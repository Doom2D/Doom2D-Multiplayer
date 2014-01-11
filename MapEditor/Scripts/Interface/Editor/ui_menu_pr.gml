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
    map_load('');
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
  //(embedded) texture list sorting menu
    case ui_mbar_m2_ts1:
      sort_tex_list(true);
    break;
    case ui_mbar_m2_ts2:
      sort_tex_list(false);
    break;
  //end of embedded menu//
  case ui_mbar_m2_deltex:
    ui_deltex_cr();
  break;
  //(embedded) map scheme menu
    case ui_mbar_m2_msf:
      map_picture();
    break;
    case ui_mbar_m2_ms16:
      map_minimap(16);
    break;
    case ui_mbar_m2_ms8:
      map_minimap(8);
    break;
    case ui_mbar_m2_ms4:
      map_minimap(4);
    break;
    case ui_mbar_m2_ms2:
      map_minimap(2);
    break;
    case ui_mbar_m2_alts:
      API_Menu_SetItemChecked(ui_mbar_m2_alts, abs(API_Menu_GetItemChecked(ui_mbar_m2_alts) - MFS_CHECKED));
    break;
  //end of embedded menu//
  case ui_mbar_m2_moveobj:
    ui_moveobj_cr();
  break;
  case ui_mbar_m2_mirrobj:
    ui_mirrobj_cr();
  break;
  case ui_mbar_m2_texopt:
    opt_tex_list();
  break;
  case ui_mbar_m2_mapopt:
    ui_mapopt_cr();
  break;
  
  //third menu
  case ui_mbar_m3_mapsets:
    ui_mapsets_cr();
  break;
  case ui_mbar_m3_edsets:
    ui_edsets_cr();
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
        'Редактор карт для Doom 2D Multiplayer 0.6' + EOL +
        '© PrimuS, Черный Думер' + EOL +
        'www.doom2d.org, 2011-2014',
        'О программе', MB_OK|MB_ICONINFORMATION);
  break;
}
