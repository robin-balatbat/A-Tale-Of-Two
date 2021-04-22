// Deal damage to the player
function playerHit(damage, flash_num){
	
	if (global.current_state == PlayerState.Verdali) {
		// reduce Verdali's HP
		global.verdali_hp -= damage;
		flash = flash_num;
	}
	else if (global.current_state == PlayerState.Bond) {
		// reduce Bond's HP
		global.bond_hp -= damage;
		flash = flash_num;
	}
}