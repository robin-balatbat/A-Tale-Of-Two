/// @description If the corresponding object has been interacted with, play
// animation and destroy

// need to change such that object is destroyed once boss is defeated
if (interactable.interactedWith) {
	//show_debug_message("Unlocked!");
	image_speed = 0.5;
	var track = audio_play_sound(snd_Death, 3, false);
	audio_sound_pitch(track, choose(0.8, 1, 1.2));
	if (animationEnd()) {
		instance_destroy();
	}
} else {
	image_speed = 0;
}
