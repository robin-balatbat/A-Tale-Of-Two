/// @description Draw the menu

draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++) {
	var offset = 2;
	var txt = menu[i];
	
	if (menu_cursor == i) {
		txt = string_insert("> ", txt, 0);
		var col = c_yellow;
	} else {
		var col = c_white;
	}
	
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	
	draw_set_color(c_grey);
	draw_text(xx - offset, yy, txt);
	draw_text(xx + offset, yy, txt);
	draw_text(xx, yy + offset, txt);
	draw_text(xx, yy - offset, txt);
	
	draw_set_color(col);
	draw_text(xx, yy, txt);
}

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(menu_x_target - 180, menu_y - (menu_itemheight * 8 * 1.5), "WASD/Arrows to Move");
draw_text(menu_x_target - 180, menu_y - (menu_itemheight * 7 * 1.5), "Space to Jump and Wall Jump");
draw_text(menu_x_target - 180, menu_y - (menu_itemheight * 6 * 1.5), "F/LMB to Melee Attack");
draw_text(menu_x_target - 180, menu_y - (menu_itemheight * 5 * 1.5), "Q to Fire Projectile");
draw_text(menu_x_target - 180, menu_y - (menu_itemheight * 4 * 1.5), "Shift/RMB to Dash or Dodge");
draw_text(menu_x_target - 180, menu_y - (menu_itemheight * 3 * 1.5), "R to Use Potion");
draw_text(menu_x_target - 180, menu_y - (menu_itemheight * 2 * 1.5), "E to Interact");