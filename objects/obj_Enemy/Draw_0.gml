/// @hit flash

draw_self();

// draw health bar below enemy
if (hitPoints < maxHP) {
	draw_healthbar(x - 16, y + 8, x + 16, y + 12, (hitPoints / maxHP) * 100, c_black, c_red, c_green, 0, true, true);
}

// draw hit flashing
if (flash > 0) {
	flash--;
	shader_set(sh_hitFlash);
	draw_self();
	shader_reset();
}


