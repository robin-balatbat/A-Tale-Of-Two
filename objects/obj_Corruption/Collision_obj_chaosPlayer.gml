/// @description Damage Chaos
global.chaos_hp--;

with (other) {
	flash = 3;
	state = "Hurt";
	knockback_speed = other.knockback * image_xscale;
}
