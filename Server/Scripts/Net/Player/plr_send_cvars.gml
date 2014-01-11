//sends cvars n shit
dll39_buffer_clear(0);
dll39_write_byte(27, 0);
dll39_write_string(global.sv_name, 0);
dll39_write_byte(global.sv_maxplayers, 0);
if global.mp_gamemode == GAME_DM {dll39_write_byte(global.mp_fraglimit, 0);} 
if global.mp_gamemode == GAME_TDM {dll39_write_byte(global.mp_scorelimit, 0);}
if global.mp_gamemode == GAME_CTF {dll39_write_byte(global.mp_caplimit, 0);}
dll39_write_byte(global.mp_waterfrag, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}
