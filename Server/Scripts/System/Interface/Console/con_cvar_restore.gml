//restores cvars to their normal shit if they are bigger
if global.sv_port < 10000 {global.sv_port = 10000;}
if global.sv_port > 65535 {global.sv_port = 65535;}

if global.sv_maxplayers < 1 {global.sv_maxplayers = 1;}
if global.sv_maxplayers > MAX_PLAYERS {global.sv_maxplayers = MAX_PLAYERS;}

if global.sv_clalert < 0 {global.sv_clalert = 0;}
if global.sv_clalert > 1 {global.sv_clalert = 1;}

if global.sv_use_pwd < 0 {global.sv_use_pwd = 0;}
if global.sv_use_pwd > 1 {global.sv_use_pwd = 1;}

if global.sv_lan < 0 {global.sv_lan = 0;}
if global.sv_lan > 1 {global.sv_lan = 1;}

if global.sv_portcheck < 0 {global.sv_portcheck = 0;}
if global.sv_portcheck > 1 {global.sv_portcheck = 1;}

if global.sv_rcon < 0 {global.sv_rcon = 0;}
if global.sv_rcon > 1 {global.sv_rcon = 1;}

if global.sv_ipbans < 0 {global.sv_ipbans = 0;}
if global.sv_ipbans > 1 {global.sv_ipbans = 1;}

if global.sv_cycle_maps < 0 {global.sv_cycle_maps = 0;}
if global.sv_cycle_maps > 2 {global.sv_cycle_maps = 2;}

if global.sv_cheats < 0 {global.sv_cheats = 0;}
if global.sv_cheats > 1 {global.sv_cheats = 1;}

if global.sv_slist_upd < 5 {global.sv_slist_upd = 5;}
if global.sv_slist_upd > 60 {global.sv_slist_upd = 60;}

if global.sv_sync_type < 0 {global.sv_sync_type = 0;}
if global.sv_sync_type > 2 {global.sv_sync_type = 2;}

if global.sv_rate < 1 {global.sv_rate = 1;}
if global.sv_rate > 64 {global.sv_rate = 64;}

if global.sv_voting < 0 {global.sv_voting = 0;}
if global.sv_voting > 1 {global.sv_voting = 1;}

if global.sv_voting_time < 10 {global.sv_voting_time = 10;}
if global.sv_voting_time > 90 {global.sv_voting_time = 90;}

if global.sv_fps_max < 20 {global.sv_fps_max = 20;}
if global.sv_fps_max > 120 {global.sv_fps_max = 120;}

if global.sv_fps_correct < 0 {global.sv_fps_correct = 0;}
if global.sv_fps_correct > 1 {global.sv_fps_correct = 1;}

if global.sv_dl_allow < 0 {global.sv_dl_allow = 0;}
if global.sv_dl_allow > 1 {global.sv_dl_allow = 1;}

if global.sv_dl_rate < 1 {global.sv_dl_rate = 1;}
if global.sv_dl_rate > 256 {global.sv_dl_rate = 256;}

if global.sv_dl_mapcfg < 0 {global.sv_dl_mapcfg = 0;}
if global.sv_dl_mapcfg > 1 {global.sv_dl_mapcfg = 1;}

if global.sv_md5check < 0 {global.sv_md5check = 0;}
if global.sv_md5check > 1 {global.sv_md5check = 1;}

if global.sv_autosave < 0 {global.sv_autosave = 0;}
if global.sv_autosave > 1 {global.sv_autosave = 1;}

if global.sv_log_update < 0 {global.sv_log_update = 0;}
if global.sv_log_update > 1 {global.sv_log_update = 1;}

if global.sv_autoexec < 0 {global.sv_autoexec = 0;}
if global.sv_autoexec > 2 {global.sv_autoexec = 2;}

if global.sv_plugins < 0 global.sv_plugins = 0;
if global.sv_plugins > 1 global.sv_plugins = 1;

if global.cl_rc_time < 3 {global.cl_rc_time = 3;}
if global.cl_rc_time > 120 {global.cl_rc_time = 120;}

if global.cl_timeout < 0 {global.cl_timeout = 0;}
if global.cl_timeout > 3600 {global.cl_timeout = 3600;}

if global.mp_gamemode < 0 {global.mp_gamemode = 0;}
if global.mp_gamemode > 2 {global.mp_gamemode = 2;}

if global.mp_automode < 0 {global.mp_automode = 0;}
if global.mp_automode > 3 {global.mp_automode = 3;}

if global.mp_ffire < 0 {global.mp_ffire = 0;}
if global.mp_ffire > 1 {global.mp_ffire = 1;}

if global.mp_fraglimit < 0 {global.mp_fraglimit = 0;}
if global.mp_fraglimit > 250 {global.mp_fraglimit = 250;}

if global.mp_scorelimit < 0 {global.mp_scorelimit = 0;}
if global.mp_scorelimit > 250 {global.mp_scorelimit = 250;}

if global.mp_caplimit < 0 {global.mp_caplimit = 0;}
if global.mp_caplimit > 250 {global.mp_caplimit = 250;}

if global.mp_timelimit < 0 {global.mp_timelimit = 0;}
if global.mp_timelimit > 9000 {global.mp_timelimit = 9000;}

if global.mp_respawn < 0 {global.mp_respawn = 0;}
if global.mp_respawn > 600 {global.mp_respawn = 600;}

if global.mp_respawn_inv < 0 {global.mp_respawn_inv = 0;}
if global.mp_respawn_inv > 10 {global.mp_respawn_inv = 10;}

if global.mp_itemrespawn < 0 {global.mp_itemrespawn = 0;}
if global.mp_itemrespawn > 300 {global.mp_itemrespawn = 300;}

if global.mp_items < 0 {global.mp_items = 0;}
if global.mp_items > 1 {global.mp_items = 1;}

if global.mp_powerups < 0 {global.mp_powerups = 0;}
if global.mp_powerups > 1 {global.mp_powerups = 1;}

if global.mp_knockback < 0 {global.mp_knockback = 0;}
if global.mp_knockback > 1 {global.mp_knockback = 1;}

if global.mp_selfdamage < 0 {global.mp_selfdamage = 0;}
if global.mp_selfdamage > 1 {global.mp_selfdamage = 1;}

if global.mp_aimtype < 0 {global.mp_aimtype = 0;}
if global.mp_aimtype > 2 {global.mp_aimtype = 2;}

if global.mp_itemdrop < 0 {global.mp_itemdrop = 0;}
if global.mp_itemdrop > 2 {global.mp_itemdrop = 2;}

if global.mp_weaponstay < 0 {global.mp_weaponstay = 0;}
if global.mp_weaponstay > 1 {global.mp_weaponstay = 1;}

if global.mp_penalty < 0 {global.mp_penalty = 0;}
if global.mp_penalty > 1 {global.mp_penalty = 1;}

if global.mp_autobalance < 0 {global.mp_autobalance = 0;}
if global.mp_autobalance > 1 {global.mp_autobalance = 1;}

if global.mp_announcer < 0 {global.mp_announcer = 0;}
if global.mp_announcer > 1 {global.mp_announcer = 1;}

if global.mp_drop_clear < 0 {global.mp_drop_clear = 0;}
if global.mp_drop_clear > 300 {global.mp_drop_clear = 300;}

if global.mp_shootjthr < 0 {global.mp_shootjthr = 0;}
if global.mp_shootjthr > 1 {global.mp_shootjthr = 1;}

if global.mp_telefrag < 0 {global.mp_telefrag = 0;}
if global.mp_telefrag > 1 {global.mp_telefrag = 1;}

if global.mp_waterfrag < 0 {global.mp_waterfrag = 0;}
if global.mp_waterfrag > 2 {global.mp_waterfrag = 2;}

if global.mp_waterbfgdmg < 10 {global.mp_waterbfgdmg = 10;}
if global.mp_waterbfgdmg > 1000 {global.mp_waterbfgdmg = 1000;}

if global.bot_names < 0 {global.bot_names = 0;}
if global.bot_names > 1 {global.bot_names = 1;}

if global.bot_chatter < 0 {global.bot_chatter = 0;}
if global.bot_chatter > 1 {global.bot_chatter = 1;}

if global.bot_randrate < 0 {global.bot_randrate = 0;}
if global.bot_randrate > 100 {global.bot_randrate = 100;}

if global.bot_userate < 0 {global.bot_userate = 0;}
if global.bot_userate > 100 {global.bot_userate = 100;}

if global.bot_cowardly < 0 {global.bot_cowardly = 0;}
if global.bot_cowardly > 1 {global.bot_cowardly = 1;}


if global.mp_godmode < 0 {global.mp_godmode = 0;}
if global.mp_godmode > 1 {global.mp_godmode = 1;}

if global.mp_flymode < 0 {global.mp_flymode = 0;}
if global.mp_flymode > 1 {global.mp_flymode = 1;}

if global.bot_dummy < 0 {global.bot_dummy = 0;}
if global.bot_dummy > 1 {global.bot_dummy = 1;}
