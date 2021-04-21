/// @description Basic movement

switch (state) {
	
	case "Idle":
		// check placement
		onGround = place_meeting(x, y + 1, obj_testWall);

		// runs under basic gravitation movement
		vsp += grv;

		// check collisions
		collisions(obj_testWall);

		if (hsp == 0) {
			hsp = -moveSpeed * image_xscale;
		}
		
		if (distance_to_object(getPlayerStateObj()) < chaseRange) {
			state = "Chase";
		}
		
		break;
		
	case "Chase":
		
		dir = sign(getPlayerStateObj().x - x);
		if (dir == 0) {
			image_xscale = 1;
		}
		
		hsp = dir * moveSpeed;
		vsp += grv;
		
		collisions(obj_testWall);
		
		if (distance_to_object(getPlayerStateObj()) > chaseRange) {
			state = "Idle";
		} else if (distance_to_object(getPlayerStateObj()) <= attackRange) {
			state = "Attack";
		}
		break;
		
	case "Attack":
		// does not need anything right now
		break;
}
