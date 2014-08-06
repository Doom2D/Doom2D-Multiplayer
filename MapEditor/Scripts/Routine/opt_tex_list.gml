//deletes unused textures from textures list

if global.tex_n == 1
{
  message_box('Список текстур пуст.',
              'Ошибка', MB_OK|MB_ICONWARNING);
  exit;
}

if !dlg_confirm() {exit;}

var tx_proc, tx_done;
tx_proc = 1; tx_done = 0;
while tx_proc < global.tex_n
{
  if ed_tex_delete(tx_proc) {tx_done += 1;} else {tx_proc += 1;}
}

message_box('Текстур до оптимизации: '    + string(global.tex_n + tx_done - 1) + EOL +
            'Текстур после оптимизации: ' + string(global.tex_n - 1)           + EOL +
            'Удалено текстур: '           + string(tx_done),
            'Оптимизация текстур', MB_OK|MB_ICONINFORMATION);
