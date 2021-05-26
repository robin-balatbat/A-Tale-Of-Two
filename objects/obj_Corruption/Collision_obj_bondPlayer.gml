/// @description Collision with Bonded Form

image_xscale = -image_xscale;

global.bond_hp-=10;

with (other) {
	if (invincible == 0) {
		flash = 3;
		state = "Hurt";
		knockback_speed = other.knockback * image_xscale;
		invincible = 70;
	}
	
}
audio_play_sound(choose(snd_Hit_Hurt1, snd_Hit_Hurt2, snd_Hit_Hurt3), 10, false);
instance_destroy();
