/// @description Initialize

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

healthbar_height = 32;
healthbar_x = 20;
healthbar_y = 20;