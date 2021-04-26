/// @description Basic movement

switch (state) {
	
	case "Idle":
		// check placement
		onGround = place_meeting(x, y + 1, obj_testWall);

		// runs under basic gravitation movement
		vsp += grv;

		// check collisions
		collisions(obj_testWall);
		counter++;
		
		// Transition trigger
		if (counter >= room_speed * 3) {
			var change = choose(0, 1);
			switch(change) {
				case 0:
					state = "Wander";
				case 1:
					counter = 0;
					break;
			}
		}
		
		if (distance_to_object(getPlayerStateObj()) < chaseRange) {
			state = "Chase";
		}
		
		hsp = 0;
	
		break;
	
	case "Wander":
		// check placement
		onGround = place_meeting(x, y + 1, obj_testWall);

		// runs under basic gravitation movement
		vsp += grv;

		// check collisions
		collisions(obj_testWall);
		
		counter++;
		
		// Transition triggers
		if (counter >= room_speed * 3) {
			var change = choose(0,1);
			switch (change) {
				case 0:
					state = "Idle";
				case 1:
					counter = 0;
					break;
			}
		}
		
		if (distance_to_object(getPlayerStateObj()) < chaseRange) {
			state = "Chase";
		}
		
		// when colliding with wall, turn around
		if (hsp == 0) {
			hsp = -moveSpeed * image_xscale;
		}
		
		// do not fall off ledge
		if (onGround && !place_meeting(x + hsp, y + 1, obj_testWall)) {
			hsp = -moveSpeed * image_xscale;
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
		
		// transitions
		if (distance_to_object(getPlayerStateObj()) > chaseRange) {
			state = "Wander";
		} else if (distance_to_object(getPlayerStateObj()) <= attackRange) {
			state = "Attack";
		}
		break;
		
	case "Attack":
		// does not need anything right now
		break;
}
