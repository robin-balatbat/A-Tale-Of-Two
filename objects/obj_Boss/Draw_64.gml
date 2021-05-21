/// @description Draw Boss Healthbar

// draw health bar below enemy
if (hitPoints < maxHP) {
	draw_healthbar(x - 16, y + 8, x + 16, y + 12, (hitPoints / maxHP) * 100, c_black, c_red, c_green, 0, true, true);
}