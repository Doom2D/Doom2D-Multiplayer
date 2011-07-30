//arg0 - sound id
//arg1 - sound x
//arg2 - sound y
if !variable_global_exists('cl_inst'){exit;}
if !instance_exists(global.cl_inst){exit;}
if global.snd[argument0] == -1 {snd_load(argument0);}

FMODListenerSet3dPosition(1, global.cl_inst.x, global.cl_inst.y, 0);
FMODSoundPlay3d(global.snd[argument0], argument1, argument2, 0);
