//corrects fps (i think)
//black doomer asked me to implement this shit
if !global.r_fps_correct {exit;}
if global.fps_last == fps && global.cl_fps_max * 2 - fps < global.cl_fps_max {exit;}
if global.cl_fps_max * 2 - fps > global.cl_fps_max {room_speed = global.cl_fps_max * 2 - fps;} else {room_speed = global.cl_fps_max;}
