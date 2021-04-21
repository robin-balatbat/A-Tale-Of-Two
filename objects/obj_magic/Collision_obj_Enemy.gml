with (other) {
	hitPoints -= other.damage;
	flash = 3;
	hitFrom = other.direction;
}

instance_destroy();
