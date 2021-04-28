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
		spawnProjectile(4, 30, obj_Magic_Blast,self);
		
	}
	
	// change to attacking state
	if (input.key_attack && onWall == 0) {
		state = "Attack";
	}
	#endregion
}


#region animations
// Dashinging animation
if (state == "Dash") {
	if (!place_meeting(x + dashSpeed, y, obj_testWall) && !place_meeting(x - dashSpeed, y, obj_testWall)) {
		x += image_xscale * dashSpeed;
		changeSprite(0.6, spr_Bond_Dash);
					
	}
				
	if (animationEnd()) {
		state = "Move";
		image_index = 0;
	}
}
// jumping animation
else if (!onGround) {
				
	if (onWall != 0) {
		changeSprite(1, spr_Bond_Wall);
	}
	// mid-air attacking
	else if (state == "Attack") {
		vsp = 0;
		changeSprite(0.7, spr_Bond_Attack);
					
		if (animationHitFrame(2)) {
			makeHitBox(spr_Bond_Attack_Mask, self, 2, 4, 10, image_xscale);
		}
					
		if (animationEnd()) {
			state = "Move";
			image_index = 0;
		}
					
	}
	// mid-air transform
	else if (state == "Transform") {
		vsp = 0;
		changeSprite(0.7, spr_Bond_Transform);
		transform(obj_verdaliPlayer);
	}
	else {
		changeSprite(0, spr_Bond_Air);
	
		// falling down
		if (sign(vsp) > 0) {
			image_index = 1;
		}
		// jumping up
		else {
			image_index = 0;
		}
	}
	
				
}
// transforming
else if (state == "Transform") {
	changeSprite(0.3, spr_Bond_Transform);
	transform(obj_verdaliPlayer);
}
// attacking while on ground
else if (state == "Attack") {
	changeSprite(0.5, spr_Bond_Attack);
	// hitboxes
	if (animationHitFrame(2)) {
		makeHitBox(spr_Bond_Attack_Mask, self, 2, 4, 10, image_xscale);
	}
				
	if (animationEnd()) {
		state = "Move";
		image_index = 0;
	}
				
}
// on ground
else {
	// idle
	if (hsp == 0) {
		changeSprite(1, spr_Bond_Idle);
	}
	// walking
	else if (abs(hsp) > 0 && abs(hsp) <= 3) {
		changeSprite(1, spr_Bond_Walk);
	}
	// running
	else {
		changeSprite(1, spr_Bond_Run);
	}

}
#endregion
