/// @description Movement, Attacking, and Animation
	
if (state == "Move") {
	#region setup calculations
	// check key input
	key_changeForm = keyboard_check_pressed(ord("X")); // changing form
	//key_spawnChaos = keyboard_check_pressed(ord("C")); // spawning Chaos

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
		
	// roll dodging
	if (input.key_dash && onGround) {
		image_index = 0;
		state = "Roll";	
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
		
	#endregion
		
	#region collision
	collisions(obj_testWall);
	#endregion
	
	#region change form
	// spawn chaos
	//if (key_spawnChaos && onGround && hsp == 0 && vsp == 0 && !chaosSpawned){
	//	screenShake(2, 20);
	//	instance_create_layer(x + 10, y - 30, "Player", obj_chaosPlayer);
	//	chaosSpawned = true;
	//}
	//chaosSpawned = false;

	// changing form
	if (key_changeForm) {
		screenShake(6, 15);
		state = "Transform";
			
	}
	#endregion
		
	#region attacking and magic
		
	// magic projectile attack limit attack based on mp
	if (input.key_magic && global.verdali_mp > 0) {
		state = "Magic";
	}
		
	// change to attacking state
	if (input.key_attack) {
		state = "Attack";
			
		// combo
		if (input.key_attack && image_index >= 2){
			image_index = 0;
			state = "Attack Two";
		}
	}
	#endregion
		
}


#region animation
switch (state) {
	#region Move
	case "Move":
		if (!onGround) {
			// mid-air attacking
			if (state == "Attack") {
				vsp = 0;
				changeSprite(0.7, spr_Verdali_Attack1);
					
				if (animationHitFrame(2)) {
					makeHitBox(spr_V_NewAttackMask, self, 2, 4, global.verdali_damageNum, image_xscale);
				}
					
				if (animationEnd()) {
					state = "Move";
					image_index = 0;
				}
					
			}
			// mid-air transform
			else if (state == "Transform") {
				vsp = 0;
				changeSprite(0.7, spr_Verdali_Transform);
				transform(obj_bondPlayer);
			}
			// normal jumping
			else {
				changeSprite(0, spr_Verdali_Air);
				
				// falling down
				if (sign(vsp) > 0) {
					image_index = 1;
				}
				// jumping up
				else {
					image_index = 0;
					
				}
			}
		} // on ground
		else {
			// idle
			if (hsp == 0) {
				changeSprite(1, spr_Verdali);
			}
			// walking
			else if (abs(hsp) > 0 && abs(hsp) <= 3) {
				changeSprite(1, spr_Verdali_Walk);
			}
			// running
			else {
				changeSprite(1, spr_Verdali_Run);
			}

		}
		break;
	#endregion
	#region Attacking
	case "Attack":
		changeSprite(0.5, spr_Verdali_Attack1);
		// hitboxes
		if (animationHitFrame(2)) {
			makeHitBox(spr_V_NewAttackMask, self, 3, 4, global.verdali_damageNum, image_xscale);
		}
				
		if (animationEnd()) {
			state = "Move";
			image_index = 0;
		}
		break;
		
	case "Attack Two":
		changeSprite(0.5, spr_Verdali_Attack2);
	
		if (animationHitFrame(2)) {
			makeHitBox(spr_Verdali_Attack2_Mask, self, 4, 4, global.verdali_damageNum, image_xscale);
		}
		
		if (animationEnd()) {
			state = "Move";
			image_index = 0;
		}
		break;
	#endregion
	#region Magic
	case "Magic":
		changeSprite(0.6, spr_Verdali_Cast);
		
		if (animationHitFrame(3)) {
			// offset the magic correctly to not hurt self
			if (image_xscale == 1) {
				spawnProjectile(30, 31, obj_Magic_Blast, self);
			} else if (image_xscale == -1) {
				spawnProjectile(-30, 31, obj_Magic_Blast, self);
			}
			
		}
		
		if (animationEnd()) {
			state = "Move";
			image_index = 0;
		}
		break;
	#endregion
	#region Rolling
	case "Roll":
		if (!place_meeting(x + rollSpeed, y, obj_testWall) && !place_meeting(x - rollSpeed, y, obj_testWall)) {
			x += image_xscale * rollSpeed;
			changeSprite(0.6, spr_Verdali_Roll);
		}
		if (animationEnd()) {
			state = "Move";
		}
		break;
	#endregion
	#region Transform
	case "Transform":
		changeSprite(0.3, spr_Verdali_Transform);
		transform(obj_bondPlayer);
		break;
	#endregion
	#region Respawn
	case "Respawn":
		// need to move this so the death animation is its own object so player not caught in death loop
		changeSprite(0.5, spr_Verdali_Death);
		if (animationEnd()){
			instance_create_layer(obj_Respawn.x, obj_Respawn.y, "Player", obj_verdaliPlayer);
			instance_destroy();
		}
		break;
	#endregion
	#region Hurt
	case "Hurt":
		knockback_state(spr_Verdali_Hurt, "Move")
		break;
	#endregion

}
#endregion
