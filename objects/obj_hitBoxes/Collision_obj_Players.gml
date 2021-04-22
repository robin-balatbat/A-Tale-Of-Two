/// @description Damaging the player
if ((creator == noone) || (creator == other) || (ds_list_find_index(hitObjects, other) != -1)) {
	exit;
}

// attacking the player
with (other) {
	playerHit(other.damage, 3);
}

ds_list_add(hitObjects, other);