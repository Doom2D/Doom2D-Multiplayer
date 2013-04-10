//init sound array
for (i = 0; i < 48; i += 1)
{
    global.snd[i] = -1;
}
global.s_preload = 0;
global._s_cur_mus = -1;

//init FMOD and drop a line to console about success
if !file_exists('GMFMODSimple.dll')
{
  con_add(':: SOUND: FATAL ERROR: File not found: GMFMODSimple.dll. Exiting...');
  global.sys_error = true;
  sys_exit();
  game_end();
  instance_destroy();
  exit;
}
if !file_exists('fmodex.dll')
{
  con_add(':: SOUND: FATAL ERROR: File not found: fmodex.dll. Exiting...');
  global.sys_error = true;
  sys_exit();
  game_end();
  instance_destroy();
  exit;
}
LoadFMOD()

fmod = FMODinit(256);
if fmod == 1
{
  con_add(':: SOUND: GMFMOD FMOD successfully initialized.');
}
else
{
  con_add(':: SOUND: ERROR: FMODinit() failed. Sound is off.');
  exit;
}

//load sounds
snd_load(99);
snd_load(98);
snd_load(0);
snd_load(1);
snd_load(2);
