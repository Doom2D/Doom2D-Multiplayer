//arg0 - sound id
if global.snd[argument0] == -1 {snd_load(argument0);}
FMODSoundPlay(global.snd[argument0]);
