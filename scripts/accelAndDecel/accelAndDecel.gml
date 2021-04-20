// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function accelAndDecel(){
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
}