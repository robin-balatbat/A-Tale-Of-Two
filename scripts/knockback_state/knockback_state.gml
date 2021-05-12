// script for knocking back an entity after attack
function knockback_state(sprite, nextState){
	// change the sprite
	changeSprite(1, sprite);
	
	// apply the speed and check for collisions
	knockback_speed = approach(knockback_speed, 0, 0.1);
	hsp = knockback_speed;
	collisions(obj_testWall);
	
	// adjust the xscale
	if (knockback_speed != 0) {
		image_xscale = -sign(knockback_speed);
	}
	
	// change the state
	if (knockback_speed == 0) {
		state = nextState;
	}
}