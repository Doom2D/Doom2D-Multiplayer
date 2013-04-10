var votes_needed;
votes_needed = ceil(instance_number(o_pl)/2);
if !global.vote_now {exit;}
if !voted
{
    global.vote_num += 1;
    net_say(cl_name + ' голосует "за". [' + string(global.vote_num) + '/' + string(votes_needed) + ']');
    voted = true;
}
else
{
    global.vote_num -= 1;
    net_say(cl_name + ' отозвал свой голос. [' + string(global.vote_num) + '/' + string(votes_needed) + ']');
    voted = false;
}

plr_send_text(cl_id, "Идет голосование: " + string(global.vote_num) + "/" + string(votes_needed), global.sv_voting_time * global.sv_fps_max, 2, c_orange, 412, 700, 4);

if global.vote_num >= votes_needed && o_host.alarm[6] > 1
{
    net_vote_pass(true);
}
