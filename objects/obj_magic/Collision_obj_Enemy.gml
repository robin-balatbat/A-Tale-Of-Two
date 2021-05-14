/// @description Deal damage to enemy

with (other) {
	
	EnemyHit(other.damage, 3);
	hitFrom = other.direction;
	state = "Hurt";
	knockback_speed = 2 * other.image_xscale;
}

instance_destroy();