
function collisions(objToCheck){
	// Horizontal Collision
	if (place_meeting(x + hsp, y, objToCheck)){
	
		while (!place_meeting(x + sign(hsp), y, objToCheck)) {
			x += sign(hsp);
		}
	
		hsp = 0;
	}
	// cannot go past with reactable (usually door) objects
	if (place_meeting(x + hsp, y, obj_Reactables)){
	
		while (!place_meeting(x + sign(hsp), y, obj_Reactables)) {
			x += sign(hsp);
		}
	
		hsp = 0;
	}
	x += hsp;

	// Vertical Collision
	if (place_meeting(x, y + vsp, objToCheck)){
	
		while (!place_meeting(x, y  + sign(vsp), objToCheck)) {
			y += sign(vsp);
		}
	
		vsp = 0;
	}
	// cannot go past with reactable (usually door) objects
	if (place_meeting(x, y + vsp, obj_Reactables)){
	
		while (!place_meeting(x, y + sign(vsp), obj_Reactables)) {
			y += sign(vsp);
		}
	
		vsp = 0;
	}
	y += vsp;
}