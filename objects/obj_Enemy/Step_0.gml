/// @description Basic movement


switch (state) {
	
	#region Idle
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
		
		// transition to chase if player in range
		if ((distance_to_object(getPlayerStateObj()) < chaseRange) && (global.current_state != PlayerState.Chaos)) {
			state = "Chase";
		}
		
		hsp = 0;
	
		break;
	#endregion
	#region Wander
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
		
		// change to chase state
		if (distance_to_object(getPlayerStateObj()) < chaseRange && (global.current_state != PlayerState.Chaos)) {
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
	#endregion
	#region Chase
	case "Chase":
	
		onGround = place_meeting(x, y + 1, obj_testWall);
		
		// move towards player
		dir = sign(getPlayerStateObj().x - x);
		if (dir == 0) {
			image_xscale = 1;
		}
		
		hsp = dir * moveSpeed;
		vsp += grv;
		
		collisions(obj_testWall);
		
		// transitions
		
		// attack and wander transitions
		if (distance_to_object(getPlayerStateObj()) > chaseRange) {
			state = "Wander";
		} else if (distance_to_object(getPlayerStateObj()) <= attackRange) { // && globalstate != chaos
			state = "Attack";
		}
		
		// do not fall off ledge
		if (onGround && !place_meeting(x + hsp, y + 1, obj_testWall)) {
			hsp = -moveSpeed * image_xscale;
		}
		
		break;
	#endregion
	#region Attack
	case "Attack":
			
		// handle the case when enemy falls off ledge
		onGround = place_meeting(x, y + 1, obj_testWall);
		
		if (!onGround) {
			state = "Chase";
		}
		
		if (animationEnd()) {
			state = "Chase";
			image_index = 0;
		}
		
		break;
	#endregion	
	#region Hurt
	case "Hurt":
		// handled in each enemy due to specific animations
		break;
	#endregion
}
