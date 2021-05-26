/// @description Basic movement
if (invincible > 0) {
	invincible--;
}
switch (state) {
	
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
		
		// launch projectile if greater than the chasing range
		counter++;
		
		// Transition trigger
		if (counter >= room_speed * 3) {
			var change = choose(0, 1);
			switch(change) {
				case 0:
					state = "Projectile";
				case 1:
					counter = 0;
					break;
			}
		}
		
		// attack transitions (randomly choose an attack to perform if player in range
		if (distance_to_object(getPlayerStateObj()) <= attackRange) { // && globalstate != chaos
			var change = choose(0,1,2);
			switch (change) {
				case 0:
					state = "Attack1";
				case 1:
					state = "Attack2";
				case 2:
					state = "Attack3";
			}
		}
		
		break;
	#endregion
	#region Attack One
	case "Attack1":
		
		if (animationEnd()) {
			state = "Chase";
			image_index = 0;
		}
		
		break;
	#endregion
	#region Attack Two
	case "Attack2":
		
		if (animationEnd()) {
			state = "Chase";
			image_index = 0;
		}
		
		break;
	#endregion
	#region Attack Three
	case "Attack3":
		
		if (animationEnd()) {
			state = "Chase";
			image_index = 0;
		}
		
		break;
	#endregion
	#region Projectile
	case "Projectile":
		
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

