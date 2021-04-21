/// @description Bond state movements and key inputs

// check key input
key_changeForm = keyboard_check_pressed(ord("X"));

if (state == "Move") {
	#region setup calculations
	// get direction movement
	move_dir = input.key_right - input.key_left;

	// check if on wall or ground
	onGround = place_meeting(x, y + 1, obj_testWall);
	onWall = place_meeting(x - 5, y, obj_testWall) - place_meeting(x + 5, y, obj_testWall);

	mvtLocked = max(mvtLocked - 1, 0);
	dashDuration = max(dashDuration - 1, 0);
	#endregion

	#region dashing
	if (dashDuration > 0) {
		vsp = 0;
	}
	else if (onWall != 0) {
		vsp = min(vsp + 1, 5);
	}
	else {
		vsp++;
	}

	// dashing state
	if (input.key_dash && (onWall == 0)) {
		state = "Dash";
	}
	#endregion

	#region jump buffering calculations
	// coyote time
	if (!onGround) {
		if (coyote_counter > 0) {
			coyote_counter--;
		
			if (!jumped) {
				if (input.key_jump) {
					vsp = -jumpSpeed;
					jumped = true;
				}
			}
		}
	} else {
		jumped = false;
		coyote_counter = coyote_max;
	}

	// Handle jump input buffering
	if (input.key_jump) {
		jumpBuffer = jumpBufMax;
	}
	#endregion

	#region horizontal and vertical movement
	// Handles horizontal left and right movement, and jumping movement
	if (mvtLocked <= 0 && dashDuration <= 0) {
	
		accelAndDecel();
	
		// handle jump calculations and jump buffering
		if (jumpBuffer > 0) {
			if (input.key_jump) {
				if (onGround) {
					vsp = -jumpSpeed;
					jumpBuffer = 0;
					jumped = true;
				}
		
				if (onWall != 0) {
					image_xscale = onWall;
					vsp = -jumpSpeed;
					hsp = onWall * moveSpeed;
					mvtLocked = maxMvtLocked;
					jumpBuffer = 0;
					jumped = true;
				}
			}
		}	
	}
	#endregion

	#region collisions
	collisions(obj_testWall);
	#endregion
	
	#region change form

	global.current_state = PlayerState.Bond;

	// changing form
	if (key_changeForm) {
		screenShake(6, 15);
		state = "Transform"
		
	}
	#endregion
	
	#region attacking and magic
		
	// magic projectile attack TODO limit attack based on mp
	// TODO: change which obj is spawned
	if (input.key_magic) {
		spawnProjectile(4, 30, obj_Magic_Blast);
	}
	#endregion
}


#region animations
changeAnimations();
#endregion
