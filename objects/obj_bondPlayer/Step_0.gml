/// @description Bond state movements and key inputs
// if dialog is going, stop
if (instance_exists(obj_Dialog)) {
	exit;
}

if (invincible > 0) {
	invincible--;
}

// check key input
key_changeForm = keyboard_check_pressed(ord("X"));

if (state == "Move") {
	// set the layer visible
	// set corruption layer visible and activate
	corruption_layer = layer_get_id("Corruption");
	layer_set_visible(corruption_layer, true);
	instance_activate_layer(corruption_layer);

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
	else if (onWall != 0 && !onGround) {
		vsp = min(vsp + 1, 5);
	}
	else {
		vsp++;
	}

	// dashing state
	if (input.key_dash && (onWall == 0)) {
		invincible = 50;
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
		
				if (onWall != 0 && !onGround) {
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
		
	// magic projectile attack
	if (input.key_magic && global.bond_mp > 0) {
		state = "Magic";
		
	}
	
	// change to attacking state
	if (input.key_attack && onWall == 0) {
		state = "Attack";
	}
	#endregion
	
	#region recovery
	if (global.recoverCount > 0 && input.key_recover) {
		global.recoverCount--;
		global.bond_hp = global.bond_maxHp;
		audio_play_sound(snd_Pickup1, 5, false);
	}
	#endregion
}


#region animations
switch (state) {
	#region Move
	case "Move":
		if (!onGround) {
			if (onWall != 0) {
				if (sprite_index = spr_Bond_Air) {
					audio_sound_pitch(snd_Jump, choose(0.8, 1.0, 1.2));
					audio_play_sound(snd_Jump, 10, false);
				}
				changeSprite(1, spr_Bond_Wall);
			}
			// mid-air attacking
			else if (state == "Attack") {
				vsp = 0;
				changeSprite(0.7, spr_Bond_Attack);
					
				if (animationHitFrame(2)) {
					makeHitBox(spr_Bond_Attack_Mask, self, 2, 4, global.bond_damageNum, image_xscale);
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
		else {
			// idle
			if (sprite_index = spr_Bond_Air) {
				audio_sound_pitch(snd_Jump, choose(0.8, 1.0, 1.2));
				audio_play_sound(snd_Jump, 10, false);
			}
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
			if (animationEnd()) {
				if (sprite_index == spr_Bond_Run) {
					var sound = audio_play_sound(choose(snd_Footsteps1, snd_Footsteps2, snd_Footsteps3), 4, false);
					audio_sound_pitch(sound, 0.1);
				}
			}
		}
		break;
	#endregion
	#region Dashing
	case "Dash":
		if (!place_meeting(x + dashSpeed, y, obj_testWall) && !place_meeting(x - dashSpeed, y, obj_testWall)) {
			x += image_xscale * dashSpeed;
			changeSprite(0.6, spr_Bond_Dash);
					
		}
				
		if (animationEnd()) {
			state = "Move";
			image_index = 0;
		}
		break;
	#endregion
	#region Attacking
	case "Attack":
		changeSprite(0.5, spr_Bond_Attack);
		// hitboxes
		if (animationHitFrame(2)) {
			makeHitBox(spr_Bond_Attack_Mask, self, 2, 4, global.bond_damageNum, image_xscale);
		}
				
		if (animationEnd()) {
			state = "Move";
			image_index = 0;
		}
		break;
	#endregion
	#region Magic
	case "Magic":
		changeSprite(0.6, spr_Bond_Cast);
		
		if (animationHitFrame(4)) {
			if (image_xscale == 1) {
				spawnProjectile(28, 12, obj_Bond_Magic, self);
			} else if (image_xscale == -1) {
				spawnProjectile(-28, 12, obj_Bond_Magic, self);
			}
			
		}
		
		if (animationEnd()) {
			state = "Move";
			image_index = 0;
		}
		break;
	#endregion
	#region Transform
	case "Transform":
		// set corruption invisible
		layer_set_visible(corruption_layer, false);
		instance_deactivate_layer(corruption_layer);
		
		// change sprite and controls
		changeSprite(0.3, spr_Bond_Transform);
		transform(obj_verdaliPlayer);
		break;
	#endregion
	#region Respawn
	case "Respawn":
		
		// deactivate corruption
		layer_set_visible(corruption_layer, false);
		instance_deactivate_layer(corruption_layer);
		
		// respawn the player
		changeSprite(0.6, spr_Bond_Transform);
		if (animationEnd()){
			with (instance_create_layer(x, y, "Player", obj_Verdali_Dead)) {
			
				hsp = lengthdir_x(1, other.image_xscale);
				vsp = lengthdir_y(1, other.image_xscale);
		
				if (sign(hsp) != 0) {
					image_xscale = sign(hsp);
				}
	
			}
			instance_destroy();
		}
		break;
	#endregion
	#region "Hurt"
	case "Hurt":
		knockback_state(spr_Bond_Hurt, "Move");
		break;
	#endregion
}
#endregion
