/// @description Bond state movements and key inputs

// check key input
key_changeForm = keyboard_check_pressed(ord("X"));

if (state == "Move") {
	#region setup calculations
	// get direction movement
	var move_dir = input.key_right - input.key_left;

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

	#region horizontal movement
	// Handles horizontal left and right movement, and jumping movement
	if (mvtLocked <= 0 && dashDuration <= 0) {
	
		// Handle horizontal acceleration and deceleration
		if (move_dir != 0) {
			image_xscale = move_dir;
		}
	
		// Acceleration
		if ((hsp < max_hsp) && (hsp > -max_hsp)) {
			hsp += move_dir * moveSpeed;
		}
		else if (hsp == max_hsp) {
			if (!input.key_right) {
				hsp--;
			}
		} else if (hsp == -max_hsp) {
			if (!input.key_left) {
				hsp++;
			}
		}
	
		// Deceleration
		if ((hsp > 0) && (!input.key_left) && (!input.key_right) && (onGround)) {
			hsp -= fric_val;
		}
	
		if ((hsp < 0) && (!input.key_left) && (!input.key_right) && (onGround)) {
			hsp += fric_val;
		}
	
	
		// force any extremely low speed to 0
		if (abs(hsp) <= 0.90) {
			hsp = 0;
		}
	
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
	
		while (!place_meeting(x, y  + sign(vsp), obj_testWall)) {
			y = y + sign(vsp);
		}
	
		vsp = 0;
	}
	y = y + vsp;
	#endregion
	
	#region change form

	global.current_state = PlayerState.Bond;

	// changing form
	if (key_changeForm && onGround) {
		show_debug_message("Attempted form change!");
		state = "Transform"
		
	}
	#endregion
	
	#region attacking and magic
		
	// magic projectile attack TODO limit attack based on mp
	// TODO: change which obj is spawned
	if (input.key_magic) {
		with (instance_create_layer(x + 4, y - 20, "Projectiles", obj_magic)) {
			image_xscale = other.image_xscale;
			hspeed = other.projSpeed * image_xscale;
		}
	}
	#endregion
}


#region animations
// animation states
/* TODO: Fix collision masks
	issues when jumping against a wall
*/

// Dashinging animation
if (state == "Dash") {
	if (!place_meeting(x + dashSpeed, y, obj_testWall) && !place_meeting(x - dashSpeed, y, obj_testWall)) {
		x += image_xscale * dashSpeed;
		image_speed = 0.6;
		sprite_index = spr_Bond_Dash;
	}
}
// jumping animation
else if (!onGround) {
	
	sprite_index = spr_Bond_Air;
	image_speed = 0;
	
	// falling down
	if (sign(vsp) > 0) {
		
		image_index = 1;
	}
	// jumping up
	else {
		image_index = 0;
	}
}
// transforming
else if (state == "Transform") {
	image_speed = 0.3;
	sprite_index = spr_Bond_Transform;
}
// on ground
else {
	image_speed = 1;
	// idle
	if (hsp == 0) {
		sprite_index = spr_Bond_Idle;
	}
	// walking
	else if (abs(hsp) > 0 && abs(hsp) <= 3) {
		sprite_index = spr_Bond_Walk;
	}
	// running
	else {
		sprite_index = spr_Bond_Run;
	}

}
#endregion
