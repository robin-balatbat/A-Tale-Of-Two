/// @description Handle collisions with walls

// Add || x, y, obj_enemy
if (place_meeting(x, y, obj_testWall)) {
	instance_destroy();
}
