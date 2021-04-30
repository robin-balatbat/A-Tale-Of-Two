/// @description draw Health bars

// update which health bar to draw
if (global.current_state == PlayerState.Verdali) {
	hpToTrack = global.verdali_hp;
	hpMaxToTrack = global.verdali_maxHp;
	healthbar_width = global.verdali_maxHp * 2;
} else if (global.current_state == PlayerState.Bond) {
	hpToTrack = global.bond_hp;
	hpMaxToTrack = global.bond_maxHp;
	healthbar_width = global.bond_maxHp * 2;
} else if (global.current_state == PlayerState.Chaos) {
	hpToTrack = global.chaos_hp;
	hpMaxToTrack = global.chaos_maxHp;
	healthbar_width = global.chaos_maxHp * 2;
}

draw_sprite_stretched(spr_Bar_BG, 0, healthbar_x, healthbar_y, healthbar_width, healthbar_height + 8);
draw_sprite_stretched(spr_HP_Bar, 0, healthbar_x, healthbar_y + 4, (hpToTrack/hpMaxToTrack) * healthbar_width, healthbar_height);
draw_sprite_stretched(spr_Bar_Border, 0, healthbar_x, healthbar_y, healthbar_width, healthbar_height + 8);