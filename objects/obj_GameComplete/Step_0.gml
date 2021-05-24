/// @description Insert description here
// You can write your code in this editor
if (input.key_recover) {
	// reset all of the global variables
	resetGlobals();
		
	global.recoverCount = 0;
	global.myLives = global.max_lives;
	global.coins = 0;
		
	game_restart();
}