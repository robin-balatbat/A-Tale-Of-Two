/// @description Collision with Bonded Form

image_xscale = -image_xscale;

global.bond_hp--;

with (other) {
	flash = 3;
	state = "Hurt";
	knockback_speed = other.knockback * image_xscale;
}

instance_destroy();
