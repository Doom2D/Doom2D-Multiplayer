//init FMOD and drop a line to console about success
LoadFMOD();
fmod = FMODinit(256);
if fmod == 1
{
  con_add(':: SOUND: GMFMOD FMOD Successfully initialized.');
}
else
{
  con_add(':: SOUND: ERROR: Could not init FMOD. Sound off.');
  //sys_exit();
}
//init sound array
for (i = 0; i < 32; i += 1)
{
    global.snd[i] = -1;
}
global.s_preload = 0;
//load sounds
snd_load(99);
snd_load(98);
snd_load(0);
snd_load(1);
snd_load(2);

global._s_cur_mus = -1;
