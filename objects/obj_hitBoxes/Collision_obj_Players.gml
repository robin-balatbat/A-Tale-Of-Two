/// @description Damaging the player
if ((creator == noone) || (creator == other) || (ds_list_find_index(hitObjects, other) != -1)) {
	exit;
}

// attacking the player
with (other) {
	if (invincible == 0) {
		playerHit(other.damage, 3);
		state = "Hurt";
		knockback_speed = other.knockback * other.image_xscale;
		invincible = 75;
	}
}
audio_play_sound(choose(snd_Hit_Hurt1, snd_Hit_Hurt2, snd_Hit_Hurt3), 15, false);
ds_list_add(hitObjects, other);