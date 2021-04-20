

if (!instance_exists(obj_chaosPlayer) && !chaosSpawned) {
	
	if (state == "Move") {
		#region setup calculations
		// check key input
		key_changeForm = keyboard_check_pressed(ord("X")); // changing form
		key_spawnChaos = keyboard_check_pressed(ord("C")); // spawning Chaos

		// get direction movement
		move_dir = input.key_right - input.key_left;

		// check if on wall or ground
		onGround = place_meeting(x, y + 1, obj_testWall);
		onWall = place_meeting(x - 5, y, obj_testWall) - place_meeting(x + 5, y, obj_testWall);

		mvtLocked = max(mvtLocked - 1, 0);
		dashDuration = max(dashDuration - 1, 0);
		#endregion
		
		#region vertical movement
		if (dashDuration > 0) {
			vsp = 0;
		}
		else if (onWall != 0) {
			vsp = min(vsp + 1, 5);
		}
		else {
			vsp++;
		}

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

		// handle jump calculations and jump buffering
		if (jumpBuffer > 0) {
			if (input.key_jump) {
				if (onGround) {
					vsp = -jumpSpeed;
					jumpBuffer = 0;
					jumped = true;
				}
		
			}
		}
		#endregion

		#region horizontal movement
		// Handles horizontal left and right movement

		accelAndDecel();
		
		// roll dodging
		if (input.key_dash && onGround) {
			image_index = 0;
			state = "Roll";	
		}
		
		#endregion
		
		#region collision
		collisions(obj_testWall);
		#endregion
	
		#region change form
		// spawn chaos
		if (key_spawnChaos && onGround && hsp == 0 && vsp == 0 && !chaosSpawned){
			show_debug_message("Chaos has appeared!");
			instance_create_layer(x, y, "Player", obj_chaosPlayer);
			chaosSpawned = true;
		}
		chaosSpawned = false;

		// changing form
		if (key_changeForm && onGround && hsp == 0 && vsp == 0) {
			state = "Transform";
			
		}
		#endregion
		
		#region attacking and magic
		
		// magic projectile attack TODO limit attack based on mp
		if (input.key_magic) {
			spawnProjectile(4, 20, obj_magic);
		}
		#endregion
			
		if (input.key_attack && onGround) {
			state = "Attack";
		}
		
	}
	
}

#region animation
changeAnimations();
#endregion
