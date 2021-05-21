if (!done) {
	// runs under basic gravitation movement
	vsp += grv;

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
		if (vsp > 0) {
			changeSprite(0.5, spr_Verdali_Death);
			if (animationEnd()){
				done = 1;
			}
		}
		while (!place_meeting(x, y  + sign(vsp), obj_testWall)) {
			y = y + sign(vsp);
		}
	
		vsp = 0;
	}
	y = y + vsp;
	
}
// respawn the player once the death animation is complete
else if (global.myLives > 0) {
	instance_create_depth(x, y, -9999, obj_Fade);
	instance_create_layer(obj_Respawn.x, obj_Respawn.y, "Player", obj_verdaliPlayer);
	instance_destroy();
}
// restart the game if the player runs out of lives
else if (global.myLives <= 0) {
	if (input.key_recover) {
		// reset all of the global variables
		resetGlobals();
		
		global.recoverCount = 0;
		global.myLives = global.max_lives;
		global.coins = 0;
		
		game_restart();
	}
}