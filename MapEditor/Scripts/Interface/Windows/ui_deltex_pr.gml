//processes textures deleting window
if ui_win5 == noval {exit;}

var cmd6;
cmd6 = API_Check_Command(6);
if cmd6 == WM_NULL {exit;}

switch cmd6
{
  case ui_win5_b1:
    var t_cnt;
    t_cnt = API_Listbox_GetSelCount(ui_win5_lb1);
    
    if t_cnt == 0
    {
      message_box('Вы должны выбрать хотя бы одну текстуру.',
                  'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    
    if !dlg_confirm() {exit;}

    var tx_next, tx_ind;
    tx_next = 0;
    for (j = 1; j <= t_cnt; j += 1)
    {
      tx_ind = API_Listbox_GetSelItem(ui_win5_lb1, tx_next, true) + 1;
      if !ed_tex_delete(tx_ind)
      {
        message_box('Текстура ' + dp_textures(global.tex_nm[tx_ind]) + ' не может быть удалена, поскольку все еще используется.',
                    'Ошибка', MB_OK|MB_ICONWARNING);
        tx_next += 1;
      }
    }
  break;
  
  case ui_win5_b2:
    API_Window_Destroy(ui_win5);
    ui_win5 = noval;
  break;
}
