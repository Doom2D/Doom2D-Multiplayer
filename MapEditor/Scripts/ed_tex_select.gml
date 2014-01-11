//texture selector
if global.tex_n == MAX_TXRS_NUM
{
  API_Dialog_MessageBox(window_handle(),
      'Достигнут лимит количества текстур.',
      'Ошибка', MB_OK|MB_ICONWARNING);
  exit;
}

var txadd, txdir, txnum, chdir;

API_FileDialog_Prepare ('Все поддерживаемые файлы текстур
                        |*.tga; *.png; *.jpg; *.gif',
                        '',
                        'data\textures\');

txdir = API_FileDialog_OpenFile(OFN_EXPLORER|OFN_NONETWORKBUTTON|OFN_HIDEREADONLY|
                                OFN_ALLOWMULTISELECT|OFN_DONTADDTORECENT|OFN_LONGNAMES|
                                OFN_NOCHANGEDIR|OFN_FILEMUSTEXIST|OFN_PATHMUSTEXIST, 1,
                                'Выберите текстуру(ы)', window_handle());

if txdir == '' {exit;}
txnum = API_FileDialog_GetNumFiles();
if txnum > 1 {txdir += '\';}
chdir = string_lower(string_copy(path_relative(txdir), 1, 14));

switch txnum
{
  case 0: break;

  case 1:
    if chdir != 'data\textures\'
    {
      API_Dialog_MessageBox(window_handle(),
          'Текстура должна находиться в data\textures.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    if mb_chktex(window_handle(), txdir) {ed_tex_load(txdir);}
  break;

  default:
    if chdir != 'data\textures\'
    {
      API_Dialog_MessageBox(window_handle(),
          'Текстуры должны находиться в data\textures.',
          'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    if global.tex_n + txnum > MAX_TXRS_NUM
    {
      txnum -= global.tex_n + txnum - MAX_TXRS_NUM;
      API_Dialog_MessageBox(window_handle(),
          'Вы выбрали количество текстур, превышающее общий лимит. Лишние текстуры добавлены не будут.',
          'Ошибка', MB_OK|MB_ICONWARNING);
    }
    var i;
    for (i = 1; i <= txnum; i += 1)
    {
      txadd = txdir + API_FileDialog_GetFile(i);
      if mb_chktex(window_handle(), txadd) {ed_tex_load(txadd);}
    }
}
