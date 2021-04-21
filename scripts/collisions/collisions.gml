// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collisions(objToCheck){
	// Horizontal Collision
	if (place_meeting(x + hsp, y, objToCheck)){
	
		while (!place_meeting(x + sign(hsp), y, objToCheck)) {
			x = x + sign(hsp);
		}
	
		hsp = 0;
	}
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x, y + vsp, objToCheck)){
	
		while (!place_meeting(x, y  + sign(vsp), objToCheck)) {
			y = y + sign(vsp);
		}
	
		vsp = 0;
	}
	y = y + vsp;
}