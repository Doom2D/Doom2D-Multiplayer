//loads a skin
//argument0 - skin dir
//free sprites
for (i = 0; i < 32; i += 1){sprites[i, 0] = -1; sprites[i, 1] = -1;}
_skin = 'data\skins\' + argument0;
if !directory_exists(_skin) 
{
  con_add(':: ERROR: Нет такого скина: data\skins\' + string(_skin) + '! Гружу скин default...');
  _skin = 'data\skins\default';
}

//walk spr
sprites[1, 0] = sprite_add(_skin + '\walk.tga', 4, 0, 0, 32, 32);
sprites[1, 1] = sprite_add(_skin + '\walkmask.tga', 4, 0, 0, 32, 32);
spr = 1;
con_add(':: Загружен скин ' + string(argument0) + '.');
