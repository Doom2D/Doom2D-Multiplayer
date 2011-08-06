global.sys_ver = '0.6';
global.sys_bld = '113';
global.sys_log = 'client';
global.sys_error = false;
_pth = 'data\logs\' + string(global.sys_log) + '.log';
_log = file_text_open_write(_pth);
file_text_close(_log);
con_init();
msg_init();
key_init();
con_add('================GAME START================');
con_add(':: SYSTEM: Date: ' + con_timestamp()) ;
msg_str = '';
global.pl_name = 'Player';
global.pl_color = make_color_rgb(64, 255, 64);
global.pl_skin = 'doomer';
global.sv_password = '';
global.sv_rcon_pwd = '';
global.sv_ip = '127.0.0.1';
global.r_massacre = 3;
global.r_names = 1;
global.r_gfx = 1;
global.map_h = 1024;
global.map_w = 1024;
global.map_bkg = bkg_inter;
global.map_mus = -1;
global.map_md5 = '';
global.sv_map_md5 = '';
global.inter_text[0] = '';
global.inter_text[1] = '';
global.inter_text[2] = '';

//texture array for shits and giggles
for (i = 0; i < 1024; i += 1)
{
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}

//init sound and font shit
snd_init();
fnt_load();
con_add(':: SYSTEM: Done without errors.');
con_add('==========================================');
con_add('Doom 2D Multiplayer v'+string(global.sys_ver)+' build '+string(global.sys_bld) + ' started.');
con_add('==========================================');
