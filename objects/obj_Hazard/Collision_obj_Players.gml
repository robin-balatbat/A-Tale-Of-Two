/// @description Force player back to respawn, reduce health by half

if (global.current_state != PlayerState.Chaos) {

	with (other) {
		// respawn the player, reduce their health by half
		state = "Respawn";
		
		if (global.current_state == PlayerState.Bond) {
			global.bond_hp = round(global.bond_hp * 0.5);
		}
		if (global.current_state == PlayerState.Verdali) {
			global.verdali_hp = round(global.verdali_hp * 0.5);
		}
	}

}