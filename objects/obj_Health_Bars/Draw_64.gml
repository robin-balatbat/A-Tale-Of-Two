/// @description draw Health bars

// update which health bar to draw
if (global.current_state == PlayerState.Verdali) {
	// health
	hpToTrack = global.verdali_hp;
	hpMaxToTrack = global.verdali_maxHp;
	healthbar_width = global.verdali_maxHp * 2;
	// magic
	mpToTrack = global.verdali_mp;
	mpMaxToTrack = global.verdali_maxMp;
	magicbar_width = global.verdali_maxMp * 2;
} else if (global.current_state == PlayerState.Bond) {
	// health
	hpToTrack = global.bond_hp;
	hpMaxToTrack = global.bond_maxHp;
	healthbar_width = global.bond_maxHp * 2;
	
	// magic
	mpToTrack = global.bond_mp;
	mpMaxToTrack = global.bond_maxMp;
	magicbar_width = global.bond_maxMp * 2;
} else if (global.current_state == PlayerState.Chaos) {
	// health
	hpToTrack = global.chaos_hp;
	hpMaxToTrack = global.chaos_maxHp;
	healthbar_width = global.chaos_maxHp * 2;
	
	// magic
	mpToTrack = global.chaos_mp;
	mpMaxToTrack = global.chaos_maxMp;
	magicbar_width = global.chaos_maxMp * 2;
}

// draw health bars
draw_sprite_stretched(spr_Bar_BG, 0, healthbar_x, healthbar_y, healthbar_width, healthbar_height + 8);
draw_sprite_stretched(spr_HP_Bar, 0, healthbar_x, healthbar_y + 4, (hpToTrack/hpMaxToTrack) * healthbar_width, healthbar_height);
draw_sprite_stretched(spr_Bar_Border, 0, healthbar_x, healthbar_y, healthbar_width, healthbar_height + 8);

// draw magic bars
draw_sprite_stretched(spr_Bar_BG, 0, magicbar_x, magicbar_y, magicbar_width, healthbar_height + 6);
draw_sprite_stretched(spr_MP_Bar, 0, magicbar_x, magicbar_y + 2, (mpToTrack/mpMaxToTrack) * magicbar_width, healthbar_height);
draw_sprite_stretched(spr_Bar_Border, 0, magicbar_x, magicbar_y, magicbar_width, healthbar_height + 6);