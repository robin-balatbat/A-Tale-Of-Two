/// @description Screenshake at beginning, reduce MP
screenShake(2, 5);

// only reduce mp if creator was player
if (creator != obj_Boss) {
	if (global.current_state == PlayerState.Verdali) {
		global.verdali_mp -= mpCost;
	} else if (global.current_state == PlayerState.Bond) {
		global.bond_mp -= mpCost;
	} else if (global.current_state == PlayerState.Chaos) {
		global.chaos_mp -= mpCost;
	}
}

