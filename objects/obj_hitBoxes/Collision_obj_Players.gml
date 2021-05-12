/// @description Damaging the player
if ((creator == noone) || (creator == other) || (ds_list_find_index(hitObjects, other) != -1)) {
	exit;
}

// attacking the player
with (other) {
	playerHit(other.damage, 3);
	state = "Hurt";
	knockback_speed = other.knockback * other.image_xscale;
}

ds_list_add(hitObjects, other);