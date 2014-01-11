//changes current map background

if background_exists(global.mbk_ind) {background_delete(global.mbk_ind);}
global.mbk_ind = noval;

if global.map_bkg == MAP_NOBKG {exit;}

if !file_exists(global.map_bkg)
{
  API_Dialog_MessageBox(window_handle(),
      'Текстура фона не найдена.',
      'Ошибка', MB_OK|MB_ICONWARNING);
  exit;
}

global.mbk_ind = background_add(global.map_bkg, false, false);
