if !global.vote_now {exit;}

var votes_needed;
votes_needed = 0;
with o_pl { if !cl_is_bot && !fsend_state {votes_needed += 1;} }  
votes_needed = ceil(votes_needed / 2);

if !voted
{
  global.vote_num += 1;
  net_say(cl_name + ' голосует "за". [' + string(global.vote_num) + '/' + string(votes_needed) + ']');
  voted = true;
} else {
  global.vote_num -= 1;
  net_say(cl_name + ' отозвал свой голос. [' + string(global.vote_num) + '/' + string(votes_needed) + ']');
  voted = false;
}

if global.vote_num >= votes_needed {net_vote_pass(true);}
