/// @description Death
if (global.verdali_hp <= 0) {
	state = "Respawn";
	global.myLives--;
	resetGlobals();
}