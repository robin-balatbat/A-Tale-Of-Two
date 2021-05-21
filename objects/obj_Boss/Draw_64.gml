/// @description Draw Boss Healthbar bottom of screen

// draw health bar below boss
if (hitPoints <= maxHP) {
	draw_healthbar((room_width/2) - 200, room_height - 40, (room_width/2) + 200, room_height - 80, (hitPoints / maxHP) * 100, c_black, c_red, c_green, 0, true, true);
}