//starts up a vote on arg0 command
if !global.sv_voting {net_tell(":: Голосования отключены."); exit;}
if !net_vote_check(string_lower(argument0))
{
    net_tell(":: Голосовать за эту команду запрещено.");
    exit;
}

var tell_cmd;
if global.vote_now
{
    tell_cmd = string_delete(global.vote_str, string_length(global.vote_str), 1);
    net_tell(":: Голосование уже идет ('" + tell_cmd + "', " + string(global.vote_num) + " голосов).");
    exit;
}
tell_cmd = string_delete(argument0, string_length(argument0), 1);
net_say(":: " + cl_name + " начал голосование: " + tell_cmd + ".#Введите 'vote' в консоли, чтобы проголосовать.#Голосование продлится " + string(global.sv_voting_time) + " сек.");

with o_pl
{
    plr_send_text(cl_id, "Идет голосование", global.sv_voting_time, 2, c_orange, 412, 700, 4);
}

o_host.alarm[6] = global.sv_voting_time * global.sv_fps_max;
global.vote_now = true;
global.vote_str = argument0;
