/// @description Create particles
// make the particles
part_system = part_system_create();
part_emitter = part_emitter_create(part_system);
part_type = part_type_create();

part_emitter_region(part_system, part_emitter, 0, display_get_width(), 0, display_get_height(), ps_shape_ellipse, ps_distr_linear);
part_emitter_stream(part_system, part_emitter, part_type, 8);

part_type_alpha2(part_type, 1, 0);
part_type_color2(part_type, c_red, c_white);
part_type_life(part_type, 40, 80);
part_type_scale(part_type, 3, 4);
part_type_gravity(part_type, 0.5, 90);
