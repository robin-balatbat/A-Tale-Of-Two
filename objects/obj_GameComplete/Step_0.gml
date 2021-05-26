/// @description Insert description here
// You can write your code in this editor
if (input.key_recover) {
	// reset all of the global variables
	audio_sound_gain(Battleground_Theme, 0, 2000);
	if (audio_sound_get_gain(Battleground_Theme) <= 0) {
		audio_stop_all();
	} 
	resetGlobals();
		
	global.recoverCount = 0;
	global.myLives = global.max_lives;
	global.coins = 0;
		
	game_restart();
}