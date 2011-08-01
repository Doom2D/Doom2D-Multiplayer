//bans client argument0's ip
var _ip, _id, f;
_id = argument0;
if !instance_exists(id_to_cl(_id)) || _id == -1 {exit;}
_ip = id_to_cl(_id).cl_ip;

if !file_exists('data\cfg\ip_bans.txt') {exit;}
f = file_text_open_append('data\cfg\ip_bans.txt');
file_text_write_string(f, _ip);
file_text_writeln(f);
file_text_close(f);

ds_list_destroy(global.ban_list);
global.ban_list = -1;
list_load('data\cfg\ip_bans.txt', 'ban_list');

plr_send_kick(_id, 'Kicked and banned.');
