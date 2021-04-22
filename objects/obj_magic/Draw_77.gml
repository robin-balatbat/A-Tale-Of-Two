/// @description Handle collisions with walls

if (place_meeting(x, y, obj_testWall)) {
	instance_destroy();
}
