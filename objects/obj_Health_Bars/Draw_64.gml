/// @description draw Health bars

// draw black background
draw_sprite_ext(spr_Pixel, 0, 10, 10, 175, 180, 0, c_black, 0.3);

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

// draw coins
draw_set_font(Main_Font1);
draw_text(coin_x, coin_y, "Coins: " + string(global.coins));
draw_set_color(c_white);

// draw lives left
draw_set_font(Main_Font1);
draw_text(lives_x, lives_y, "Lives: " + string(global.myLives));
draw_set_color(c_white);

// draw amount of health potions needed
var recoverItem = getPlayerStateObj().recoverCount;
if (recoverItem > 0) {
	draw_sprite_ext(spr_Potion, 1, potion_x, potion_y, 1, 1, 0, c_white, 1);
	draw_text(50, potion_y + 5, ": " + string(recoverItem));
}
