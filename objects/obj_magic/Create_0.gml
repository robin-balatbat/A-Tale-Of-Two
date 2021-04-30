/// @description Screenshake at beginning, reduce MP
screenShake(2, 5);


if (global.current_state == PlayerState.Verdali) {
	global.verdali_mp -= mpCost;
} else if (global.current_state == PlayerState.Bond) {
	global.bond_mp -= mpCost;
} else if (global.current_state == PlayerState.Chaos) {
	global.chaos_mp -= mpCost;
}
