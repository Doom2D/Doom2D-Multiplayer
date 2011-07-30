//loops music
//arg0 - music
FMODInstanceStop(global._s_cur_mus);
global._s_cur_mus = FMODSoundLoop(argument0);
