//loads a skin
//argument0 - skin dir

var skin_d, info_f;
for (i = 0; i < 32; i += 1)
{
  sprites[i, 0] = -1;
  sprites[i, 1] = -1;
}

skin_d = 'data\skins\' + argument0;
if !skin_check(skin_d)
{
  con_add(':: ERROR: Скин "' + string(argument0) + '" не найден, либо он поврежден. Загрузка скина "doomer"...');
  skin_d = 'data\skins\doomer';
}

info_f = file_text_open_read(skin_d + '\INFO');
r_weapon = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[1, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[2, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[9, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[5, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[3, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[4, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[6, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[7, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
sprites[8, 2] = file_text_read_real(info_f);
file_text_readln(info_f);
r_xoff[1] = file_text_read_real(info_f);
file_text_readln(info_f);
r_yoff[1] = file_text_read_real(info_f);
file_text_readln(info_f);
r_xoff[2] = file_text_read_real(info_f);
file_text_readln(info_f);
r_yoff[2] = file_text_read_real(info_f);
file_text_readln(info_f);
r_xoff[3] = file_text_read_real(info_f);
file_text_readln(info_f);
r_yoff[3] = file_text_read_real(info_f);
file_text_readln(info_f);
r_xoff[4] = file_text_read_real(info_f);
file_text_readln(info_f);
r_yoff[4] = file_text_read_real(info_f);
file_text_close(info_f);

sprites[1, 0] = sprite_add(skin_d + '\stand.tga',          sprites[1, 2], false, false, 32, 32);
sprites[1, 1] = sprite_add(skin_d + '\standmask.tga',      sprites[1, 2], false, false, 32, 32);
sprites[2, 0] = sprite_add(skin_d + '\walk.tga',           sprites[2, 2], false, false, 32, 32);
sprites[2, 1] = sprite_add(skin_d + '\walkmask.tga',       sprites[2, 2], false, false, 32, 32);
sprites[3, 0] = sprite_add(skin_d + '\seeup.tga',          sprites[3, 2], false, false, 32, 32);
sprites[3, 1] = sprite_add(skin_d + '\seeupmask.tga',      sprites[3, 2], false, false, 32, 32);
sprites[4, 0] = sprite_add(skin_d + '\seedown.tga',        sprites[4, 2], false, false, 32, 32);
sprites[4, 1] = sprite_add(skin_d + '\seedownmask.tga',    sprites[4, 2], false, false, 32, 32);
sprites[5, 0] = sprite_add(skin_d + '\attack.tga',         sprites[5, 2], false, false, 32, 32);
sprites[5, 1] = sprite_add(skin_d + '\attackmask.tga',     sprites[5, 2], false, false, 32, 32);
sprites[6, 0] = sprite_add(skin_d + '\attackup.tga',       sprites[6, 2], false, false, 32, 32);
sprites[6, 1] = sprite_add(skin_d + '\attackupmask.tga',   sprites[6, 2], false, false, 32, 32);
sprites[7, 0] = sprite_add(skin_d + '\attackdown.tga',     sprites[7, 2], false, false, 32, 32);
sprites[7, 1] = sprite_add(skin_d + '\attackdownmask.tga', sprites[7, 2], false, false, 32, 32);
sprites[8, 0] = sprite_add(skin_d + '\pain.tga',           sprites[8, 2], false, false, 32, 32);
sprites[8, 1] = sprite_add(skin_d + '\painmask.tga',       sprites[8, 2], false, false, 32, 32);
sprites[9, 0] = sprite_add(skin_d + '\die.tga',            sprites[9, 2], false, false, 32, 32);
sprites[9, 1] = sprite_add(skin_d + '\diemask.tga',        sprites[9, 2], false, false, 32, 32);

spr = 1;

