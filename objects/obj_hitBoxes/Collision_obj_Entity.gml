/// @description Damage other entities
if ((creator == noone) || (creator == other) || (ds_list_find_index(hitObjects, other) != -1)) {
	exit;
}

with (other) {
	EnemyHit(other.damage, 3);
	hitFrom = other.direction;
	state = "Hurt";
	knockback_speed = other.knockback * other.image_xscale;
	
	// increase magic points based on current form
	if (global.current_state == PlayerState.Verdali) {
		if (global.verdali_mp < global.verdali_maxMp) {
			global.verdali_mp += 5;
		}
	}
	if (global.current_state == PlayerState.Bond) {
		if (global.bond_mp < global.bond_maxMp) {
			global.bond_mp += 5;
		}
	}
}
audio_play_sound(choose(snd_Hit_Hurt1, snd_Hit_Hurt2, snd_Hit_Hurt3), 15, false);
ds_list_add(hitObjects, other);


