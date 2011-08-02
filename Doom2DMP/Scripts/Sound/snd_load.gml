//loads sound with id in argument0
switch argument0
{
case 99:
//Menu music
global.mus_menu = FMODSoundAdd('data\music\Menu.xm');
FMODSoundSetGroup(global.mus_menu, 3);
break;

case 98:
//game music (none yet)
global.map_mus = -1;
FMODSoundSetGroup(global.map_mus, 3);
break;

case 0:
//0 - Menu scroll
global.snd[0] = FMODSoundAdd('data\sounds\menu\scroll.wav');
FMODSoundSetGroup(global.snd[0], 2);
break;

case 1:
//1 - Menu select
global.snd[1] = FMODSoundAdd('data\sounds\menu\select.wav');
FMODSoundSetGroup(global.snd[1], 2);
break;

case 2:
//2 - Menu exit
global.snd[2] = FMODSoundAdd('data\sounds\player\fall.wav');
FMODSoundSetGroup(global.snd[2], 2);
break;

case 3:
//3 - Item pickup
global.snd[3] = FMODSoundAdd('data\sounds\item\pick_i.wav', true);
FMODSoundSetGroup(global.snd[3], 2);
FMODSoundSet3dMinMaxDistance(global.snd[3], 0, 512);
break;

case 4:
//4 - Arms pickup
global.snd[4] = FMODSoundAdd('data\sounds\item\pick_w.wav', true);
FMODSoundSetGroup(global.snd[4], 2);
FMODSoundSet3dMinMaxDistance(global.snd[4], 0, 512);
break;

case 5:
//5 - Powerups pickup
global.snd[5] = FMODSoundAdd('data\sounds\item\pick_p.wav', true);
FMODSoundSetGroup(global.snd[5], 2);
FMODSoundSet3dMinMaxDistance(global.snd[5], 0, 512);
break;

case 6:
//6 - Player falls
global.snd[6] = FMODSoundAdd('data\sounds\player\fall.wav', true);
FMODSoundSetGroup(global.snd[6], 2);
FMODSoundSet3dMinMaxDistance(global.snd[6], 0, 1024);
break;

case 7:
//7 - Player gets damage
global.snd[7] = FMODSoundAdd('data\sounds\player\pain.wav', true);
FMODSoundSetGroup(global.snd[7], 2);
FMODSoundSet3dMinMaxDistance(global.snd[7], 0, 512);
break;

case 8:
//8 - Player dies
global.snd[8] = FMODSoundAdd('data\sounds\player\death.wav', true);
FMODSoundSetGroup(global.snd[8], 2);
FMODSoundSet3dMinMaxDistance(global.snd[8], 0, 1024);
break;

case 9:
//9 - Item respawn
global.snd[9] = FMODSoundAdd('data\sounds\item\spawn_i.wav', true);
FMODSoundSetGroup(global.snd[9], 2);
FMODSoundSet3dMinMaxDistance(global.snd[9], 64, 256);
break;

case 10:
//10 - Player respawn
global.snd[10] = FMODSoundAdd('data\sounds\player\death.wav', true);
FMODSoundSetGroup(global.snd[10], 2);
FMODSoundSet3dMinMaxDistance(global.snd[10], 0, 256);
break;

case 11:
//11 - Pistol
global.snd[11] = FMODSoundAdd('data\sounds\weapon\pst_fire.wav', true);
FMODSoundSetGroup(global.snd[11], 2);
FMODSoundSet3dMinMaxDistance(global.snd[11], 0, 1024);
break;

case 12:
//12 - Shotgun
global.snd[12] = FMODSoundAdd('data\sounds\weapon\sgun_fire.wav', true);
FMODSoundSetGroup(global.snd[12], 2);
FMODSoundSet3dMinMaxDistance(global.snd[12], 0, 1024);
break;

case 13:
//13 - SuperShotgun
global.snd[13] = FMODSoundAdd('data\sounds\weapon\ssgun_fire.wav', true);
FMODSoundSetGroup(global.snd[13], 2);
FMODSoundSet3dMinMaxDistance(global.snd[13], 0, 1024);
break;

case 14:
//14 - Rocketlauncher
global.snd[14] = FMODSoundAdd('data\sounds\weapon\rckt_fire.wav', true);
FMODSoundSetGroup(global.snd[14], 2);
FMODSoundSet3dMinMaxDistance(global.snd[14], 0, 1024);
break;

case 15:
//15 - Plasma
global.snd[15] = FMODSoundAdd('data\sounds\weapon\pgun_fire.wav', true);
FMODSoundSetGroup(global.snd[15], 2);
FMODSoundSet3dMinMaxDistance(global.snd[15], 0, 1024);
break;

case 16:
//16 - BFG
global.snd[16] = FMODSoundAdd('data\sounds\weapon\bfg_fire.wav', true);
FMODSoundSetGroup(global.snd[16], 2);
FMODSoundSet3dMinMaxDistance(global.snd[16], 0, 1024);
break;

case 17:
//17 - Punch
global.snd[17] = FMODSoundAdd('data\sounds\weapon\punch.wav', true);
FMODSoundSetGroup(global.snd[17], 2);
FMODSoundSet3dMinMaxDistance(global.snd[17], 0, 1024);
break;

case 18:
//18 - Chainsaw (fire)
global.snd[18] = FMODSoundAdd('data\sounds\weapon\saw_fire.wav', true);
FMODSoundSetGroup(global.snd[18], 2);
FMODSoundSet3dMinMaxDistance(global.snd[18], 0, 1024);
break;

case 19:
//19 - Chainsaw (idle)
global.snd[19] = FMODSoundAdd('data\sounds\weapon\saw_idle.wav', true);
FMODSoundSetGroup(global.snd[19], 2);
FMODSoundSet3dMinMaxDistance(global.snd[19], 0, 1024);
break;

case 20:
//20 - Gibbage
global.snd[20] = FMODSoundAdd('data\sounds\player\flesh.wav', true);
FMODSoundSetGroup(global.snd[20], 2);
FMODSoundSet3dMinMaxDistance(global.snd[20], 0, 1024);
break;

case 21:
//21 - Gib bounce
global.snd[21] = FMODSoundAdd('data\sounds\player\gib.wav', true);
FMODSoundSetGroup(global.snd[21], 2);
FMODSoundSet3dMinMaxDistance(global.snd[21], 0, 512);
break;

case 22:
//22 - Explosion
global.snd[22] = FMODSoundAdd('data\sounds\weapon\explos.wav', true);
FMODSoundSetGroup(global.snd[22], 2);
FMODSoundSet3dMinMaxDistance(global.snd[22], 0, 1024);
break;

case 23:
//23 - Superchaingun
global.snd[23] = FMODSoundAdd('data\sounds\weapon\scgun_fire.wav', true);
FMODSoundSetGroup(global.snd[23], 2);
FMODSoundSet3dMinMaxDistance(global.snd[23], 0, 1024);
break;

case 24:
//24 - Chat
global.snd[24] = FMODSoundAdd('data\sounds\menu\radio.wav');
FMODSoundSetGroup(global.snd[24], 2);
break;

case 25:
//25 - Plasma splash
global.snd[25] = FMODSoundAdd('data\sounds\weapon\splash.wav', true);
FMODSoundSetGroup(global.snd[25], 2);
FMODSoundSet3dMinMaxDistance(global.snd[25], 0, 512);
break;

case 26:
//26 - Quit
global.snd[26] = FMODSoundAdd('data\sounds\menu\close.wav');
FMODSoundSetGroup(global.snd[26], 2);
break;
}
