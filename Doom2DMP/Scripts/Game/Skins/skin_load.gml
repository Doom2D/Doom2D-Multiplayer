//loads a skin
//argument0 - skin dir
//free sprites
var info;
for (i = 0; i < 32; i += 1){sprites[i, 0] = -1; sprites[i, 1] = -1;}
_skin = 'data\skins\' + argument0;
if !directory_exists(_skin) 
{
  con_add(':: ERROR: Нет такого скина: data\skins\' + string(_skin) + '! Гружу скин doomer...');
  _skin = 'data\skins\doomer';
}
if !file_exists(_skin + '\INFO') 
{
  con_add(':: ERROR: Нет такого скина: data\skins\' + string(_skin) + '! Гружу скин doomer...');
  _skin = 'data\skins\doomer';
}

info = file_text_open_read(_skin + '\INFO');
r_weapon = file_text_read_real(info);
file_text_readln(info);
sprites[1, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[2, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[9, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[5, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[3, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[4, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[6, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[7, 2] = file_text_read_real(info);
file_text_readln(info);
sprites[8, 2] = file_text_read_real(info);
file_text_close(info);

//walk spr
sprites[1, 0] = sprite_add(_skin + '\stand.tga', sprites[1, 2], 0, 0, 32, 32);
sprites[1, 1] = sprite_add(_skin + '\standmask.tga', sprites[1, 2], 0, 0, 32, 32);
sprites[2, 0] = sprite_add(_skin + '\walk.tga', sprites[2, 2], 0, 0, 32, 32);
sprites[2, 1] = sprite_add(_skin + '\walkmask.tga', sprites[2, 2], 0, 0, 32, 32);
sprites[3, 0] = sprite_add(_skin + '\seeup.tga', sprites[3, 2], 0, 0, 32, 32);
sprites[3, 1] = sprite_add(_skin + '\seeupmask.tga', sprites[3, 2], 0, 0, 32, 32);
sprites[4, 0] = sprite_add(_skin + '\seedown.tga', sprites[4, 2], 0, 0, 32, 32);
sprites[4, 1] = sprite_add(_skin + '\seedownmask.tga', sprites[4, 2], 0, 0, 32, 32);
sprites[5, 0] = sprite_add(_skin + '\attack.tga', sprites[5, 2], 0, 0, 32, 32);
sprites[5, 1] = sprite_add(_skin + '\attackmask.tga', sprites[5, 2], 0, 0, 32, 32);
sprites[6, 0] = sprite_add(_skin + '\attackup.tga', sprites[6, 2], 0, 0, 32, 32);
sprites[6, 1] = sprite_add(_skin + '\attackupmask.tga', sprites[6, 2], 0, 0, 32, 32);
sprites[7, 0] = sprite_add(_skin + '\attackdown.tga', sprites[7, 2], 0, 0, 32, 32);
sprites[7, 1] = sprite_add(_skin + '\attackdownmask.tga', sprites[7, 2], 0, 0, 32, 32);
sprites[8, 0] = sprite_add(_skin + '\pain.tga', sprites[8, 2], 0, 0, 32, 32);
sprites[8, 1] = sprite_add(_skin + '\painmask.tga', sprites[8, 2], 0, 0, 32, 32);
sprites[9, 0] = sprite_add(_skin + '\die.tga', sprites[9, 2], 0, 0, 32, 32);
sprites[9, 1] = sprite_add(_skin + '\diemask.tga', sprites[9, 2], 0, 0, 32, 32);
spr = 1;
