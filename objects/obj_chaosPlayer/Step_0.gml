/// @description Control movement and actions for chaos
global.current_state = PlayerState.Chaos;
// get input
key_return = keyboard_check_pressed(ord("R")); // return back to Verdali

// calculate direction
hDir = input.key_right - input.key_left;
vDir = input.key_down - input.key_up;

// 8-direction movement
if (hDir != 0 || vDir != 0){
	dir = point_direction(0, 0, hDir, vDir);
	moveX = lengthdir_x(moveSpeed, dir);
	moveY = lengthdir_y(moveSpeed, dir);

	x += moveX;
	y += moveY;
	
}

// magic projectile attack limit attack based on mp
if (input.key_magic && global.chaos_mp > 0) {
	spawnProjectile(1, 1, obj_Magic_Blast, self);	
}

// move back to verdali upon key_return press
if (key_return) {
	move_towards_point(verdali_location.x, verdali_location.y, return_speed);
	returning = true;
	
}

// return if hp is depleted
if (global.chaos_hp <= 0) {
	dir = point_direction(x, y, verdali_location.x, verdali_location.y);
	dir = roundDir(dir);
	move_towards_point(verdali_location.x, verdali_location.y, return_speed);
	returning = true;
}

// return if mp is depleted
if (global.chaos_mp <= 0) {
	dir = point_direction(x, y, verdali_location.x, verdali_location.y);
	dir = roundDir(dir);
	move_towards_point(verdali_location.x, verdali_location.y, return_speed);
	returning = true;
}

/* TODO upon collision with corruption
	reduce health
	
	TODO flip the switch in a room upon interact key
	if (key_interact && in range of switch) {
		if switch == flipped {
			return to Verdali
		}
	}
	
	TODO refactor code so that returning to verdali
	is function
	
	TODO ignore any corruption/enemies if returning
	idea: move checking input inside a if (!returning) {
		// moving code inside here
	}
*/

// Update Animations
image_xscale = 1;
switch(dir) {
	case 0:
		changeSprite(0.5, spr_Chaos_Right);
		break;
	case 45:
		changeSprite(0.5, spr_Chaos_UpRight);
		break;
	case 90:
		changeSprite(0.5, spr_Chaos_Up);
		break;
	case 135:
		changeSprite(0.5, spr_Chaos_UpRight);
		image_xscale = -1;
		break;
	case 180:
		changeSprite(0.5, spr_Chaos_Right);
		image_xscale = -1;
		break;
	case 225:
		changeSprite(0.5, spr_Chaos_DownRight);
		image_xscale = -1;
		break;
	case 270:
		changeSprite(0.5, spr_Chaos_Down);
		break;
	case 315:
		changeSprite(0.5, spr_Chaos_DownRight);
		break;
}

if (hDir == 0 && vDir == 0) {
	changeSprite(0.2, spr_Chaos_Idle);
}

// destroy instance once within range
if (returning) {
	screenShake(1, 10);
	if (distance_to_object(obj_verdaliPlayer) < destroy_range) {
		screenShake(2, 10);
		global.current_state = PlayerState.Verdali;
		instance_destroy();
	}
}



