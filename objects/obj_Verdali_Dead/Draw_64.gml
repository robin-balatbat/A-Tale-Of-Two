/// @description Draw Game Over Screen
if (global.myLives <= 0) {
	draw_sprite_ext(spr_Pixel, 0, 0, 0, room_width, room_height, 0, c_black, 1);
	draw_set_halign(fa_center);
	draw_text(view_wview, view_hview, "You died.");
	draw_set_color(c_red);
	
	draw_text(view_wview, view_hview + 30, "Press R to Restart.");
	draw_set_color(c_white);
}

