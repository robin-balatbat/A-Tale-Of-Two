/// @description Deal damage to entity

/// @description Collision with a hitbox

if ((creator == noone) || (creator == self)) {
	exit;
} else {

	with (other) {
	
		EnemyHit(other.damage, 3);
		image_xscale = other.sign(x);
		hitFrom = other.direction;
	
	}
}

instance_destroy();