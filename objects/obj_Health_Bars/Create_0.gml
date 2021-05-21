/// @description Initialize

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

healthbar_height = 32;
healthbar_x = 20;
healthbar_y = 20;

magicbar_x = 20;
magicbar_y = 64;

coin_x = 20;
coin_y = 100;

lives_x = 20;
lives_y = 125;

potion_x = 20;
potion_y = 155;