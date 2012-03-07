global.g_part_sys = part_system_create();
part_system_depth(global.g_part_sys, -5);

//blood
global.g_particle[1] = part_type_create();
part_type_shape(global.g_particle[1], pt_shape_square);
part_type_size(global.g_particle[1], 0.05, 0.06, 0, 0);
part_type_color1(global.g_particle[1], c_maroon);
part_type_life(global.g_particle[1], 8, 12);
part_type_speed(global.g_particle[1], 0.5, 1.5, 0, 0);
part_type_direction(global.g_particle[1], 0, 360, 0, 0);
part_type_gravity(global.g_particle[1], 0.2, 270);

//sparks
global.g_particle[2] = part_type_create();
part_type_shape(global.g_particle[2], pt_shape_square);
part_type_size(global.g_particle[2], 0.03, 0.035, 0, 0);
part_type_color1(global.g_particle[2], c_yellow);
part_type_life(global.g_particle[2], 8, 12);
part_type_speed(global.g_particle[2], 0.25, 0.75, 0, 0);
part_type_direction(global.g_particle[2], 0, 360, 0, 0);
part_type_gravity(global.g_particle[2], 0.2, 270);
