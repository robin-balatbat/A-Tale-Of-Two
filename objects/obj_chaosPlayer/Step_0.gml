/// @description Control movement and actions for chaos
global.current_state = PlayerState.Chaos;
// get input
key_return = keyboard_check_pressed(ord("R")); // return back to Verdali

// calculate direction
hDir = input.key_right - input.key_left;
vDir = input.key_down - input.key_up;

// chaos is capable of 8-direction movement
if (hDir != 0 || vDir != 0){
	dir = point_direction(0, 0, hDir, vDir);
	moveX = lengthdir_x(moveSpeed, dir);
	moveY = lengthdir_y(moveSpeed, dir);

	x += moveX;
	y += moveY;
}

// move back to verdali upon key_return press
if (key_return) {
	move_towards_point(verdali_location.x, verdali_location.y, return_speed);
	returning = true;
	
}

/* TODO upon collision with corruption
	reduce health
	
	if (global.chaosHealth <= 0) {
		return to verdali
	}
	
	TODO if chaos runs out of energy, return
	if (global.chaosEnergy <= 0) {
		return to verdali
	}
	
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

// destroy instance once within range
if (returning) {
	screenShake(1, 10);
	if (distance_to_object(obj_verdaliPlayer) < destroy_range) {
		screenShake(2, 10);
		global.current_state = PlayerState.Verdali;
		instance_destroy();
	}
}
