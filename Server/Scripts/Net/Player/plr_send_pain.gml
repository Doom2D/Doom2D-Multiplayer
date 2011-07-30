//if it's time to pain, send pain
if pt > 0 {exit;}
plr_send_sound(7, x, y); 
plr_send_sprite(cl_id, 0, 1); 
pt = 32;

