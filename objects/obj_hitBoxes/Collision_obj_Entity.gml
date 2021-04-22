/// @description Damage other entities
if ((creator == noone) || (creator == other) || (ds_list_find_index(hitObjects, other) != -1)) {
	exit;
}

with (other) {
	EnemyHit(other.damage, 3);
	hitFrom = other.direction;
}

ds_list_add(hitObjects, other);
show_debug_message(other.hitPoints);


