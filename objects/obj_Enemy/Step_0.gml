/// @description Basic movement

// check placement
onGround = place_meeting(x, y + 1, obj_testWall);

// runs under basic gravitation movement
vsp += grv;

// check collisions
collisions(obj_testWall);

if (hsp == 0) {
	hsp = -moveSpeed * image_xscale;
}

show_debug_message(hitPoints);