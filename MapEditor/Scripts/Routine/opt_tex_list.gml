//deletes unused textures from textures list

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
    'Текстур до оптимизации: ' + string(global.tex_n + tx_done - 1) + EOL +
    'Текстур после оптимизации: ' + string(global.tex_n - 1) + EOL +
    'Удалено текстур: ' + string(tx_done),
    'Оптимизация текстур', MB_OK|MB_ICONINFORMATION);
