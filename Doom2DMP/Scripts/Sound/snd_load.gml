//loads megaton of sounds
//Menu music
global.mus_menu = FMODSoundAdd('data\music\Menu.xm');
FMODSoundSetGroup(global.mus_menu, 3);

//0 - Menu scroll
global.snd[0] = FMODSoundAdd('data\sounds\menu\scroll.wav');
FMODSoundSetGroup(global.snd[0], 2);

//1 - Menu select
global.snd[1] = FMODSoundAdd('data\sounds\menu\select.wav');
FMODSoundSetGroup(global.snd[1], 2);

//2 - Player fall
global.snd[2] = FMODSoundAdd('data\sounds\player\fall.wav');
FMODSoundSetGroup(global.snd[2], 2);
con_add(':: Sounds loaded.');
