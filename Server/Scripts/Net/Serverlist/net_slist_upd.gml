//updates an entry in the serverlist
if global.sv_lan {exit;}
var _sl_sock, _sl_str, _sl_name, _sl_map, _sl_host, _sl_hstr, _sl_prt, _sl_mod;
_sl_name = '';

_sl_mod = '[MOD]';
switch global.mp_gamemode
{
    case 0: _sl_mod = '[DM]'; break;
    case 1: _sl_mod = '[TDM]'; break;
    case 2: _sl_mod = '[CTF]'; break;
}

if global.sv_use_pwd {_sl_name = '*';}

_sl_name += global.sv_name;
_sl_map = _sl_mod + global.sv_map;
_sl_plr = string(instance_number(o_pl)) + '/' + string(global.sv_maxplayers);
_sl_ver = global.sys_ver + " (" + global.sys_bld + ")";

_sl_hstr = string_explode(global.sv_slist, ':', false);
_sl_host = string(ds_list_find_value(_sl_hstr, 0));
_sl_prt = real(ds_list_find_value(_sl_hstr, 1));
if _sl_prt == 0 {_sl_prt = 25667;}
ds_list_destroy(_sl_hstr);

_sl_mod = 'MOD';
switch global.mp_gamemode
{
    case 0: _sl_mod = 'DM'; break;
    case 1: _sl_mod = 'TDM'; break;
    case 2: _sl_mod = 'CTF'; break;
}

_sl_sock = dytcpconnect(_sl_host, _sl_prt, 1);
if (!_sl_sock) {
    con_add(":: NET: SLIST: WARNING: Не удалось получить доступ к мастерсерверу. sv_lan -> 1."); 
    global.sv_lan = 1; 
}
else
{
    //dll39_set_nagle(_sl_sock, 1);
    dyclearbuffer(global._sl_buf);
    dywritebyte(1, global._sl_buf);
    dywritestring(_sl_name, global._sl_buf);
    dywritestring(_sl_map, global._sl_buf);
    dywritestring(_sl_plr, global._sl_buf);
    dywritestring(_sl_ver, global._sl_buf);
    dywritedouble(global.sv_port, global._sl_buf);
    dysendmessage(_sl_sock, 0, 0, global._sl_buf);

    dyclosesock(_sl_sock);

    con_add(':: NET: SLIST: Синхронизировались с мастерсервером.');
}
