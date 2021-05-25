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
audio_play_sound(choose(snd_Hit_Hurt1, snd_Hit_Hurt2, snd_Hit_Hurt3), 10, false);