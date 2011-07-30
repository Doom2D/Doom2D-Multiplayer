//frees a sound with id argument0 from memory
if global.snd[argument0] == -1 {exit;}
FMODSoundFree(global.snd[argument0]);
global.snd[argument0] = -1;
