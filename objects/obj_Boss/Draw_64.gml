/// @description Draw Boss Healthbar

// draw health bar below enemy
if (hitPoints <= maxHP) {
	draw_healthbar(x - 100, y + 80, x + 100, y + 120, (hitPoints / maxHP) * 100, c_black, c_red, c_green, 0, true, true);
}