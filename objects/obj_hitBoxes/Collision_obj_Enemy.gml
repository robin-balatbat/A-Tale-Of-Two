/// @description Testing collision with enemies
if (creator == noone || creator == other) {
	exit;
}

with (other) {
	EnemyHit(other.damage, 3);
}