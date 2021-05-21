if (!done) {
	// runs under basic gravitation movement
	vsp += grv;

	// Horizontal Collision
	if (place_meeting(x + hsp, y, obj_testWall)){
	
		while (!place_meeting(x + sign(hsp), y, obj_testWall)) {
			x = x + sign(hsp);
		}
	
		hsp = 0;
	}
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x, y + vsp, obj_testWall)){
		if (vsp > 0) {
			done = 1;
			image_index = 1;
		}
		while (!place_meeting(x, y  + sign(vsp), obj_testWall)) {
			y = y + sign(vsp);
		}
	
		vsp = 0;
	}
	y = y + vsp;
	
}