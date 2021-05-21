/// @description Death
if (global.bond_hp <= 0) {
	state = "Respawn";
	global.myLives--;
	resetGlobals();
}