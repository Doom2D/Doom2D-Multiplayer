//FPS Correction script (sys_fps_correct)

if !global.sv_fps_correct || fps == global.sv_fps_max {exit;}
if fps < global.sv_fps_max {room_speed = global.sv_fps_max * 2 - fps;}
if fps > global.sv_fps_max {room_speed = max(1, room_speed - (fps - global.sv_fps_max));}

