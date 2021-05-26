/// @description Deal damage to Player

with (other) {
	
	if (invincible == 0) {
		playerHit(other.damage, 3);
		hitFrom = other.direction;
		state = "Hurt";
		knockback_speed = 2 * other.image_xscale;
		invincible = 75;
	}
	
}
audio_play_sound(choose(snd_Hit_Hurt1, snd_Hit_Hurt2, snd_Hit_Hurt3), 10, false);
instance_destroy();
