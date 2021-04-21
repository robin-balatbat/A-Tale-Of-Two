// gets the player object based on the global state
function getPlayerStateObj(){
	
	if (global.current_state == PlayerState.Bond) {
		return obj_bondPlayer;
	}
	else if (global.current_state == PlayerState.Verdali) {
		return obj_verdaliPlayer;
	}
	else if (global.current_state == PlayerState.Chaos) {
		return obj_chaosPlayer;
	}
}