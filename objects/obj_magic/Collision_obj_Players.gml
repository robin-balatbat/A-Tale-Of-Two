/// @description Deal damage to Player

with (other) {
	
	playerHit(other.damage, 3);
	hitFrom = other.direction;
	state = "Hurt";
	knockback_speed = 2 * other.image_xscale;
}

instance_destroy();
