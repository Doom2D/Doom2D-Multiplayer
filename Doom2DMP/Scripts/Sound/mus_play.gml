//loops music
//arg0 - music
FMODInstanceStop(global._s_cur_mus);
if argument0 != -1 {global._s_cur_mus = FMODSoundLoop(argument0);} else {global._s_cur_mus = -1;}
