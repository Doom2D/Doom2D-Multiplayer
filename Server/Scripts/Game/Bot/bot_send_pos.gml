//sends bot position (if bot)
if !variable_local_exists('cl_is_bot') {exit;}
plr_send_pos();
