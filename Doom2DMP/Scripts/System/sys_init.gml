randomize();
set_application_title('Doom 2D Multiplayer 0.6');

global.sys_ver = '0.6';
global.sys_bld = '127';
global.sys_log = 'client';
//global.sys_log = 'client' + string(irandom(99999999)); -- uncomment this when testing 2 clients
global.sys_error = false;
global.sys_cleanup = 0;
if !directory_exists('data')
{
    directory_create('data');
}
if !directory_exists('data\logs\')
{
    directory_create('data\logs');
}
_pth = 'data\logs\' + string(global.sys_log) + '.log';
_log = file_text_open_write(_pth);
file_text_close(_log);
con_init();
msg_init();
key_init();
con_add('================GAME START================');
con_add(':: SYSTEM: Дата: ' + con_timestamp()) ;
sys_file_check();
msg_str = '';
global.pl_name = 'Player';
global.pl_color = make_color_rgb(64, 255, 64);
global.pl_skin = 'doomer';
global.pl_team = 1;
global.sv_password = '';
global.sv_rcon_pwd = '';
global.sv_ip = '127.0.0.1:25666';
global.mp_fraglimit = 23;
global.mp_gamemode = 0;
global.mp_waterfrag = 2;
global.cl_slist = '94.19.235.229:25667';
global.cl_rc_time = 7;
global.cl_rate = 2;
global.cl_sync_type = 0;
global.cl_dl_allow = 1;
global.cl_dl_override = 1;
global.cl_fps_max = 60;
global.cl_physics = 1;
global.cl_interp = 0;
global.r_massacre = 3;
global.r_names = 1;
global.r_gfx = 1;
global.r_announcer = 1;
global.r_fskip = 0;
global.r_window = 1;
global.r_width = 800;
global.r_height = 600;
global.r_scale = 1;
global.r_fps_correct = 0;
global.r_vsync = 0;
global.r_announcer = 1;
global.r_flash = 1;
global.r_drawhud = 1;
global.r_depth = display_get_colordepth();
global.r_wsplash = 1;

global.slist[0, 0] = 0;
global.map_h = 320;
global.map_w = 240;
global.map_bkg = bkg_inter;
global.map_mus = -1;
global.map_md5 = '';
global.map_done = 0;
global.sv_map_md5 = '';
global.sv_dlallow = 0;

global.inter_text[0] = '';
global.inter_text[1] = '';
global.inter_text[2] = '';

global.fget_path = '';
global.fget_file = -1;
global.fget_pos = 0;
global.fget_state = 0;
global.fget_size = 0;
global.fget_md5 = '';

global.team_score[1] = 0;
global.team_score[2] = 0;

global.dem_ver = 1;
global.dem_mode = 0; //0 - nothing, 1 - record, 2- play
global.dem_will = 'НЕТ'; //future mode
global.dem_f = -1;
global.dem_b = -1;
global.dem_sz = 0;
global.dem_t = 0;
global.dem_fn = 'demos\demo01.dgp';
global.dem_pause = 0;
global.dem_menu = 0;

global.menu_id = 0; //0 - main, 1 - settings, 2 - sound, 3 - bind, 4 - gfx, 5 - player, 6 - start
global.menu_sel = 0;

//texture array for shits and giggles
for (i = 0; i < 256; i += 1)
{
  global.tex[i] = -1;
}
global.tex[0] = tex_none;

global.cl_tiles = ds_list_create();

//init sound and font shit and thread stuff
snd_init();
fnt_load();
con_add(':: SYSTEM: Ошибок не обнаружено.');
con_add('==========================================');
con_add('Doom 2D Multiplayer '+string(global.sys_ver)+' (Cборка '+string(global.sys_bld) + ') запущен.');
con_add('==========================================');
