//texture selector
if global.tex_n == MAX_TXRS_NUM
{
  message_box('Достигнут лимит количества текстур.',
              'Ошибка', MB_OK|MB_ICONWARNING);
  exit;
}

var txadd, txdir, txnum, chdir;

API_FileDialog_Prepare('Все поддерживаемые файлы текстур
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
      message_box('Текстура должна находиться в data\textures.',
                  'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }
    if mb_chktex(txdir) {ed_tex_load(txdir);}
  break;

  default:
    if chdir != 'data\textures\'
    {
      message_box('Текстуры должны находиться в data\textures.',
                  'Ошибка', MB_OK|MB_ICONWARNING);
      exit;
    }

    var fnum, i;
    fnum = txnum;

    if global.tex_n + txnum > MAX_TXRS_NUM
    {
      txnum -= global.tex_n + txnum - MAX_TXRS_NUM;
      message_box('Вы выбрали количество текстур, превышающее общий лимит. Лишние текстуры добавлены не будут.',
                  'Ошибка', MB_OK|MB_ICONWARNING);
    }

    for (i = 1; i <= txnum; i += 1)
    {
      txadd = txdir + API_FileDialog_GetFile(i);
      if mb_chktex(txadd) {ed_tex_load(txadd);} else if txnum < fnum {txnum += 1;}
    }
}
