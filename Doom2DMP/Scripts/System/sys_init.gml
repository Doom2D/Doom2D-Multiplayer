global.sys_ver = '0.6';
global.sys_bld = '100 (02.05.2010)';
con_init();
msg_init();
con_add('================GAME START================');
snd_init();
con_add(':: GMFMOD FMOD Initialized.');
con_add(':: Sounds loaded.');
fnt_load();
con_add(':: Fonts loaded.');
con_add(':: Everything looks OK.');
con_add('==========================================');
con_add('Doom 2D Multiplayer v'+string(global.sys_ver)+' build '+string(global.sys_bld) + ' started.');
con_add('==========================================');
cfg_load('user.cfg');
msg_str = '';
global.pl_name = 'Unnamed';
global.pl_color = make_color_rgb(128, 255, 128);
global.pl_skin = 'default';
