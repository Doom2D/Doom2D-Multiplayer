//arg0 - sound id
//arg1 - sound x
//arg2 - sound y
if !variable_global_exists('cl_inst'){exit;}
if !instance_exists(global.cl_inst){exit;}
if global.snd[argument0] == -1 {snd_load(argument0);}

FMODSoundPlay3d(global.snd[argument0], argument1, argument2, 0);
