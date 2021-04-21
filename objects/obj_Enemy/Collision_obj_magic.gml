/// @description Get damaged by magic
with (other) {
	other.hitPoints -= damage;
	other.flash = 3;
	other.hitFrom = direction;
}

instance_destroy(other);
