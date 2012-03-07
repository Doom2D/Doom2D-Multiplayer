//corrects fps (i think)
//black doomer asked me to implement this shit
if !global.sv_fps_correct {exit;}
if global.fps_last == fps && global.sv_fps_max * 2 - fps < global.sv_fps_max {exit;}
if global.sv_fps_max * 2 - fps > global.sv_fps_max {room_speed = global.sv_fps_max * 2 - fps;} else {room_speed = global.sv_fps_max;}
