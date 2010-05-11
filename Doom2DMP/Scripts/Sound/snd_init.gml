//init FMOD and drop a line to console about success
LoadFMOD();
fmod = FMODinit(256);
if fmod == 1
{
  con_add(':: GMFMOD FMOD Successfully initialized.');
}
else
{
  con_add(':: ERROR: Could not init FMOD. Sound off.');
  //sys_exit();
}
//load sounds
snd_load();
