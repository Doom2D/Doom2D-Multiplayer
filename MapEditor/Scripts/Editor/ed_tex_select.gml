//texture selector
var fd, fn, ff;

API_FileDialog_Prepare ('Все поддерживаемые файлы текстур
                        |*.tga; *.png; *.jpg; *.gif',
                        'STD_1_16_16.tga',
                        'data\textures\',
                        '.tga');

fd = API_FileDialog_OpenFile(OFN_EXPLORER|OFN_HIDEREADONLY|OFN_ALLOWMULTISELECT|OFN_DONTADDTORECENT|
                             OFN_LONGNAMES|OFN_FILEMUSTEXIST|OFN_PATHMUSTEXIST, 1,
                             'Выберите текстуру(ы)', window_handle());

fn = API_FileDialog_GetNumFiles();

if fn == 0 {exit;}
if fn == 1
{
    ed_tex_load(fd);
    exit;
}

ff = 0;
while ff < fn
{
    ff += 1;
    ed_tex_load(fd + '\' + API_FileDialog_GetFile(ff));
}

