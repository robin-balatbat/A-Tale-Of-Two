/// @description Initialize the particle system
randomize();

global.partSystem = part_system_create();
part_system_depth(global.partSystem, -100);