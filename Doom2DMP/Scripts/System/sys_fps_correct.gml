//FPS сorrection

//if !global.r_fps_correct || fps == global.cl_fps_max {exit;}
if fps == global.cl_fps_max {exit;}
if fps < global.cl_fps_max {room_speed = global.cl_fps_max * 2 - fps;}
if fps > global.cl_fps_max {room_speed = max(20, room_speed - (fps - global.cl_fps_max));}

