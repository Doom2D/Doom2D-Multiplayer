//a0: if the vote passed
if !global.vote_now {exit;}

if argument0
{
  net_say(":: Голосование прошло успешно. Команда будет запущена через 5 секунд.");
  with o_pl {plr_send_text(cl_id, "Голосование успешно.", 3, 2, c_lime, 412, 700, 4);}
  global.vote_old = global.vote_str;
  o_host.alarm[7] = 5 * global.sv_fps_max;
} else {
  net_say(":: Голосование провалилось.");
  with o_pl {plr_send_text(cl_id, "Голосование провалилось.", 3, 2, c_red, 412, 700, 4);}
}

net_vote_clean();
